class UsersController < InheritedResources::Base
  protect_from_forgery with: :null_session, :if => 
    Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json
  respond_to :html, :except => [:dump]

  def dump
    @users = User.includes(:tickets)
  end

  def invite
    referral = User.find_or_initialize_by(:email => params[:user][:email])
    if referral.persisted?
      redirect_to :back
      flash[:error] = 'User with provided email already exists.'
    else
      referral.referrer_id = params[:user_id]
      referral.save
      redirect_to user_path(params[:user_id])
      flash[:success] = "You have invited #{referral}"
    end
  end

  def build_resource_params
    [params.fetch(:user, {}).permit(:email, :referrer_id)]
  end

end
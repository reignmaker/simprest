class UsersController < InheritedResources::Base
  protect_from_forgery with: :null_session, :if => 
    Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json
  respond_to :html, :except => [:dump]

  def dump
    @users = User.includes(:tickets)
  end

  def invite
    referral = User.find_or_initialize_by(
      :email => params[:user][:email], :referrer_id  => params[:user_id])
    respond_to do |format|
      if referral.save
        format.html { redirect_to user_path(params[:user_id]),
                    :notice => "You have invited #{referral}" }
        format.json { render :json => referral, :status => :created }
      else
        format.html { redirect_to :back,
                      :alert => referral.errors.full_messages }
        format.json { render :json => referral.errors,
                     :status => :unprocessable_entity}
      end
    end
  end

  def build_resource_params
    [params.fetch(:user, {}).permit(:email, :referrer)]
  end

end
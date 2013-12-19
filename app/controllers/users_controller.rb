class UsersController < InheritedResources::Base
  protect_from_forgery with: :null_session, :if => 
    Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json
  respond_to :html, :except => [:dump]

  def dump
    @users = User.includes(:tickets)
  end

  def build_resource_params
    [params.fetch(:user, {}).permit(:email, :referrer)]
  end

end
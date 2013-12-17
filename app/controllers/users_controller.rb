class UsersController < InheritedResources::Base
  respond_to :json
  respond_to :html, :except => [:dump]

  def dump
    @users = User.includes(:tickets)
  end

  def build_resource_params
    [params.fetch(:user, {}).permit(:email, :referrer)]
  end

end
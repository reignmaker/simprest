class UsersController < InheritedResources::Base

  def build_resource_params
    [params.fetch(:user, {}).permit(:email, :referrer)]
  end

end
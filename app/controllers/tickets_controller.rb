class TicketsController < InheritedResources::Base
  belongs_to :user
  def build_resource_params
    [params.fetch(:ticket, {}).permit(:user, :key)]
  end

end

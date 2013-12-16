class TicketsController < InheritedResources::Base

  def build_resource_params
    [params.fetch(:ticket, {}).permit(:user, :key)]
  end

end

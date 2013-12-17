class TicketsController < InheritedResources::Base
  respond_to :html, :json
  belongs_to :user
  def build_resource_params
    [params.fetch(:ticket, {}).permit(:user, :key)]
  end

end

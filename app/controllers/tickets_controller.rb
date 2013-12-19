class TicketsController < InheritedResources::Base
  protect_from_forgery with: :null_session, :if => 
    Proc.new { |c| c.request.format == 'application/json' }
    
  respond_to :html, :json
  belongs_to :user
  def build_resource_params
    [params.fetch(:ticket, {}).permit(:user, :key)]
  end

end

class Ticket < ActiveRecord::Base
  belongs_to :user
  validates :user, :presence => true
  before_create :sign_ticket

  private
  def sign_ticket
    self.key = SecureRandom.hex
  end
  
end

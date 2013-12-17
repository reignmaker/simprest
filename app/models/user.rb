class User < ActiveRecord::Base
  has_many :tickets
  has_many :referrals, :class_name => 'User', :foreign_key => :referrer_id
  belongs_to :referrer, :class_name => 'User'

  validates :email, :presence => true
  validate :valid_referrer

  private
  def valid_referrer
    if self == referrer
        errors.add(:referrer_id, "you can't be invited by self")
    elsif referrer_id_changed? and self.persisted?
      errors.add(:referrer_id, "you are already registered. You can't change your referrer.")
    end
  end

end

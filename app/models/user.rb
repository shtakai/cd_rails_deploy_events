class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :location, :state,
    presence: true
  validates :password,
    length: {minimum:8, allow_nil: true}
  validates :state, length: {minimum:2, maximum:2}
  validates :email, uniqueness: true, email: true

  has_many :hosted_events, class_name: 'Event', foreign_key: :user_id, dependent: :destroy
  has_many :attends, dependent: :destroy
  has_many :events, through: :attends, class_name: 'Event', foreign_key: :event_id
  has_many :comments

  before_save :upcase_state

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private


  def upcase_state
    self.state.upcase!
  end

end

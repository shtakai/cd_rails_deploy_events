class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :email, :location, :state,
    presence: true
  validates :password,
    length: {minimum:8, allow_nil: true}
  validates :state, length: {minimum:2, maximum:2}
  validates :email, uniqueness: true, email: true


  before_save :upcase_state


  private


  def upcase_state
    self.state.upcase!
  end

end

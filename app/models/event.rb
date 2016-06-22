class Event < ActiveRecord::Base
  validates :name, :date, :location,
    presence: true
  validates :state, length: {minimum:2, maximum:2}

  before_save :upcase_state

  belongs_to :user

  private

  def upcase_state
    self.state.upcase!
  end
end

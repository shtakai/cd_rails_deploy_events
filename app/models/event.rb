class Event < ActiveRecord::Base
  validates :name, :date, :location,
    presence: true
  validates :state, length: {minimum:2, maximum:2}

  before_save :upcase_state

  belongs_to :host, class_name: 'User', foreign_key: :user_id

  has_many :attends, dependent: :destroy
  has_many :users, through: :attends, class_name: 'User', foreign_key: :event_id

  has_many :comments

  scope :state, ->(state) {
    includes(:attends).where(state: state).order(updated_at: :desc)
  }

  scope :other_state, ->(state) {
    includes(:attends).where.not(state: state).order(updated_at: :desc)
  }

  private

  def upcase_state
    self.state.upcase!
  end
end

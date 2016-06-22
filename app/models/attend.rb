class Attend < ActiveRecord::Base
  #validates :user, uniqueness: { scope: :attendend_event }

  belongs_to :event, class_name: 'Event', foreign_key: :event_id
  belongs_to :user, class_name: 'User', foreign_key: :user_id


end

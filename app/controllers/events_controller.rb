class EventsController <  ApplicationController
  before_action :redirect_no_auth
  def index
    @instate_events = Event.state get_user.state
    @outstate_events = Event.other_state get_user.state
  end
end

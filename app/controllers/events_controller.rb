class EventsController <  ApplicationController
  before_action :redirect_no_auth
  def index
    get_events
    @new_event = Event.new
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    if @event.host.id == session[:user_id]
      @event.destroy
      flash[:notice] = "Event #{@event.name} deleted."
    else
      flash[:alert] = "Event deletion failed"
    end
    redirect_to '/events'
  end

  def create
    @new_event = Event.new event_params
    @new_event.host = get_user
    if @new_event.save
      flash[:notice] = "Event #{@new_event.name} created"
      redirect_to '/events'
    else
      flash[:alert] = "Event #{@new_event.name} creation failed"
      get_events
      render "events/index"
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :state)
  end

  def get_events
    @instate_events = Event.state get_user.state
    @outstate_events = Event.other_state get_user.state
  end

end

class EventsController <  ApplicationController
  before_action :redirect_no_auth
  def index
    @instate_events = Event.state get_user.state
    @outstate_events = Event.other_state get_user.state
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


end

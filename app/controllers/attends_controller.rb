class AttendsController < ApplicationController
  before_action :redirect_no_auth

  def create
    event = Event.find_by(id: params[:event_id])
    @attend = Attend.new(
      user: get_user,
      event: event
    )
    flash[:alert] = "Can't attend." if !@attend.valid?
    flash[:notice] = "Joined Event #{event.name}" if @attend.save
    redirect_to '/events'
  end

  def destroy
    @attend = Attend.find_by(id: params[:id]).destroy
    flash[:notice] = "Canceled Event #{@attend.event.name}"
    redirect_to '/events'
  end

  private

end

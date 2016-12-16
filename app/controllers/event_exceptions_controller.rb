class EventExceptionsController < ApplicationController
  def create
    @event = Event.find params[:event_id]
    date = Chronic.parse(params[:event_exception][:skip_time])
    # pry date
    @exception = @event.event_exceptions.new(skip_time: date)
    @exception.save!
    redirect_to @event, notice: 'Success!'
  end

  def destroy
    @event = Event.find params[:event_id]
    time = Chronic.parse(params[:id])
    e = @event.event_exceptions.find_by_skip_time(time)
    e.destroy
    redirect_to @event, notice: 'Exception removed'
  end
end

class EventExceptionsController < ApplicationController
  def create
    @event = Event.find params[:event_id]
    date = Chronic.parse(params[:event_exception][:skip_time])
    # pry date
    @exception = @event.event_exceptions.new(skip_time: date)
    @exception.save!
    redirect_to @event, notice: 'Success!'
  end
end

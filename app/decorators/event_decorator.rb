class EventDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def start_time
    object.begins.strftime('%I:%M %p')
  end

  def end_time
    object.ends.strftime('%I:%M %p')
  end

  def next_up
    object.schedule.next_occurrence.strftime('%A, %b %d, %Y')
  end

end

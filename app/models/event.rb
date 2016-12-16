class Event < ApplicationRecord
  belongs_to :user
  has_secure_token
  has_many :event_exceptions
  def to_s
    email
  end

  def rule
    if RecurringSelect.is_valid_rule?(repeat_rule)
      RecurringSelect.dirty_hash_to_rule(repeat_rule)
    else
      return false
    end
  end

  def schedule
    test_starts = Chronic.parse('today at 3pm')
    if rule
      sched = IceCube::Schedule.new(start = test_starts, end_time: test_starts + 2.hours)
      sched.add_recurrence_rule(rule)
      if !event_exceptions.blank?
        event_exceptions.each do |ee|
          sched.add_exception_time(ee.skip_time)
        end
      end
      sched
    else
      return false
    end
  end

  def remaining_occurrences
    schedule.occurrences(ends) if schedule
  end
end

class Event < ApplicationRecord
  belongs_to :user
  has_secure_token
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
    if rule
      sched = IceCube::Schedule.new
      sched.add_recurrence_rule(rule)
      sched
    else
      return false
    end
  end

  def remaining_occurrences
    schedule.occurrences(ends) if schedule
  end
end

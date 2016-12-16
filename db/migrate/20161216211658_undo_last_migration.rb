class UndoLastMigration < ActiveRecord::Migration[5.0]
  # Event.first.event_exceptions.create(skip_time: Chronic.parse('today at 3pm'))
  def up
    change_column :event_exceptions, :skip_time, :datetime
  end

  def down
    change_column :event_exceptions, :skip_time, :date
  end
end

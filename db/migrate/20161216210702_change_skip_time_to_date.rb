class ChangeSkipTimeToDate < ActiveRecord::Migration[5.0]
  def up
    change_column :event_exceptions, :skip_time, :date
  end

  def down
    change_column :event_exceptions, :skip_time, :datetime
  end
end

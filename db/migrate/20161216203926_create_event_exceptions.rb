class CreateEventExceptions < ActiveRecord::Migration[5.0]
  def change
    create_table :event_exceptions do |t|
      t.string :token
      t.references :event, foreign_key: true
      t.datetime :skip_time

      t.timestamps
    end
    add_index :event_exceptions, :token, unique: true
  end
end

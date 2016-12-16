class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :token
      t.references :user, foreign_key: true
      t.datetime :begins
      t.datetime :ends
      t.boolean :repeats
      t.text :repeat_rule
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :events, :token, unique: true
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :location
      t.string :state
      t.references :user

      t.timestamps null: false
    end
    add_index :events, :user_id
  end
end

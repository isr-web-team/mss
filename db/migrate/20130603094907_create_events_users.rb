class CreateEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users do |t|
      t.references :event, index: true, null: false
      t.references :user, index: true, null: false
      t.integer :attend_flg
      t.string :comment

      t.timestamps
    end
  end
end

class CreateEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users, :id => false do |t|
      t.references :event, index: true
      t.references :user, index: true
      t.integer :attend_flg
      t.string :comment

      t.timestamps
    end
  end
end

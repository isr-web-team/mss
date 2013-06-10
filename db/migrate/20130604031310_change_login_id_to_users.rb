class ChangeLoginIdToUsers < ActiveRecord::Migration
  def change
    change_column :users, :login_id, :string
  end
end

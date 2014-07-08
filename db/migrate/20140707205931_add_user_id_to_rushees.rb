class AddUserIdToRushees < ActiveRecord::Migration
  def change
    add_column :rushees, :user_id, :integer
    add_index :rushees, :user_id
  end
end

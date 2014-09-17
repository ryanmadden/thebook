class RemoveBioFromRushees < ActiveRecord::Migration
  def change
    remove_column :rushees, :bio, :string
    add_column :rushees, :bio, :text
  end
end

class AddLegacyToRushees < ActiveRecord::Migration
  def change
    add_column :rushees, :legacy, :boolean
  end
end

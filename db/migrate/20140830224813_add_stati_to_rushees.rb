class AddStatiToRushees < ActiveRecord::Migration
  def change
    add_column :rushees, :bid_offered, :boolean
    add_column :rushees, :bid_dropped, :boolean
    add_column :rushees, :bid_rejected, :boolean
    add_column :rushees, :bid_tabled, :boolean
  end
end

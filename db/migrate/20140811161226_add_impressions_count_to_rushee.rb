class AddImpressionsCountToRushee < ActiveRecord::Migration
  def self.up
    add_column :rushees, :impressions_count, :integer
  end

  def self.down
  	remove_column :rushees, :int
  end
end

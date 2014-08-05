class AddAttachmentImageToRushees < ActiveRecord::Migration
  def self.up
    change_table :rushees do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :rushees, :image
  end
end

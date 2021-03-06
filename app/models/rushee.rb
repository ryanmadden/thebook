class Rushee < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	acts_as_votable
	is_impressionable :counter_cache => true, :unique => :all, :column_name => :impressions_count

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end

class Task < ApplicationRecord
	belongs_to :user
	delegate :name, :to => :user, :prefix => true
	validates :user_id, presence:true
	validates :content, presence:true, length: { maximum:140 }
	scope :desc, -> { order("tasks.created_at DESC") }
end
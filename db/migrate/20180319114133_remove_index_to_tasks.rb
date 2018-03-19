class RemoveIndexToTasks < ActiveRecord::Migration[5.1]
	def up
		# user_idへのindexは外部キー制約ですでに存在していたため、ここでは不要なindex剥がしのみ実装
		remove_index :tasks, [:user_id,:name, :content, :created_at]
	end

	def down
		# user_idへのindexは外部キー制約ですでに存在しているため、このrollbackは不適切だが一応記載
		add_index  :tasks, [:user_id, :name, :content, :created_at]
	end
end
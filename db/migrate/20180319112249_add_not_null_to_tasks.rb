class AddNotNullToTasks < ActiveRecord::Migration[5.1]
	def change
		change_column_null :tasks, :content, false
		change_column_null :tasks, :user_id, false
	end
end
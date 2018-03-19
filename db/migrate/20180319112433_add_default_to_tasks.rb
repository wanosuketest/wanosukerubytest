class AddDefaultToTasks < ActiveRecord::Migration[5.1]

	def up
		change_column_default :tasks, :admin, false
	end

	def down
		# 内容としては不適切だが学習のため一応記載
		change_column_default :tasks, :admin, nil
	end

end
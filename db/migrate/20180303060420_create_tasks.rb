class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content
      t.datetime :deadline
      t.string :status
      t.string :priority
      t.string :label
      t.boolean :admin
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :tasks, [:user_id, :name, :content, :created_at]
  end
end

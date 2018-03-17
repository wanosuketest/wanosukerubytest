require 'rails_helper'

RSpec.describe Task, type: :model do

	describe 'Taskモデルのテスト' do
		before do
			@user = build(:michael)
			@task = @user.tasks.build(content:"test")

		end

		describe 'モデルのvalidatesテスト' do
			it 'user_idがなければエラー' do
				@task.user_id = nil
				expect(@task.valid?).to eq false
			end

			it 'contentがなければエラー' do
				@task.content = nil
				expect(@task.valid?).to eq false
			end

			it '作成日時の降順での表示テスト' do
				@task = create(:most_recent)
				recent_task = Task.desc.first
				expect(@task == recent_task).to eq true
			end
		end
	end
end
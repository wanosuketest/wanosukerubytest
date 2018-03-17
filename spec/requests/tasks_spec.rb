require 'rails_helper'

RSpec.describe "Tasks", type: :request do

	describe "タスク関連のテスト" do
		let(:task) { attributes_for(:most_recent) }
		before do
			@test_task = create(:most_recent)
		end

		describe 'POST #create' do
			it 'ログインしていないと登録できずログイン画面にリダイレクトすること' do
				post tasks_path , params: task
				expect(response).to redirect_to login_url
			end
		end

		describe 'DELETE #destroy' do
			it 'ログインしていないと削除できずログイン画面にリダイレクトすること' do
				delete task_path(@test_task)
				expect(response).to redirect_to login_url
			end
		end
	end
end
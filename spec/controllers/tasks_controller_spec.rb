require 'rails_helper'

RSpec.describe TasksController, type: :controller do

	describe "タスク関連のテスト" do
		before do
			@user = create(:michael)
			log_in_as(@user)
			# ユーザー名：thirdに紐づくタスク
			@test_task = create(:ants)
		end	

		describe 'DELETE #create' do
			it 'ログインユーザーに紐付かないタスクを削除しようとすると失敗し、タスク一覧にリダイレクトする' do
				expect{ delete :destroy, params: { id: @test_task.id } }.to_not change(Task, :count)
				expect(response).to redirect_to @user
			end

			it 'ログインユーザーに紐付くタスクを削除しようとすると成功する' do
				delete_task = @user.tasks.create!(content:"delete")
				expect{ delete :destroy, params: { id: delete_task.id } }.to change(Task, :count).by(-1)
			end
		end
	
		describe 'GET #edit' do 
			it 'ログインユーザーに紐付かないタスクを編集しようとすると失敗し、タスク一覧にリダイレクトする' do
				get :edit, params: { id: @test_task.id }
				expect(response).to redirect_to @user
			end
		end

		describe 'PATCH #update' do 
			it 'ログインユーザーに紐付いてはいるが無効なデータを更新しようとすると失敗し、editにリダイレクトする' do
				invalid_task = @user.tasks.create!(content:"delete")
				invalid_task.content = ""
				patch :update, params: { id: invalid_task.id , task: { content: invalid_task.content} }
				expect(response).to render_template 'tasks/edit'
			end

			it 'ログインユーザーに紐付いており有効なデータを更新できる' do
				# ? michaelに紐づくタスクを生成しようとしているが、Validation failed: Email has already been taken　とでて失敗する
				@valid_task = create(:bee)
				content = "success"
				patch :update, params: { id: valid_task.id , task: { content: content} }
				@valid_task.reload
				expect(content == @reload_task.content).to eq true
			end
		end
	end
end
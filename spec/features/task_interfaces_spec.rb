require 'rails_helper'

RSpec.feature "TaskInterface", type: :feature do

	feature "ログインからタスク登録、ログアウトまで" do
		scenario 'ログインしタスク登録&削除＆編集＆詳細確認後、他のユーザーのタスク一覧は見えないことを確認し、ログアウトできること' do
			#capybara側で参照しているtestDBに対しユーザーを作成する
			user = create(:michaelsan)
			another_user = create(:michaelyon)
			another_user.tasks.create!(content:"test")
			#有効なユーザでログインする
			visit login_path
			fill_in 'Email', with: user.email
			fill_in 'Password', with: user.password
			click_button 'ログイン'
			#タスクの中身が空だと登録失敗する
			fill_in 'Content', with:''
			expect{ click_button '登録する' }.not_to change(Task, :count)
			#有効なタスクを登録し、作成日の降順となることを確認する
			fill_in 'Content', with:'最初の山下達郎'
			expect{ click_button '登録する' }.to change(Task, :count).by(1)
			fill_in 'Content', with:'後から桑田佳祐'
			expect{ click_button '登録する' }.to change(Task, :count).by(1)
			expect( first('.content') ).to have_content '後から桑田佳祐'
			#タスクを削除する
			expect{ first('.operate').click_link('削除する') }.to change(Task, :count).by(-1)
			#タスクを更新する
			click_link('編集する')
			fill_in 'Content', with:'更新後の山下達郎'
			click_button '更新する'
			expect( first('.content') ).to have_content '更新後の山下達郎'
			#タスクの詳細画面へ問題なく遷移する
			click_link '更新後の山下達郎'
			click_link '一覧へ戻る'
			# 他のユーザーに遷移した時、タスク一覧が表示されないこと
			visit user_path(another_user)
			expect(page).not_to have_css '.content'
			# ログアウトが正常にでき、ログイン画面に遷移すること
			click_link 'ログアウト'
			expect(page).to have_button 'ログイン'
		end
	end
end
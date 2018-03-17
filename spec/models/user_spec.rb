require 'rails_helper'

RSpec.describe User, type: :model do

	describe 'Userモデルのテスト' do
		before do
			@user = User.new(name: "Example User", email: "user@example.com",
							password: "foobar", password_confirmation: "foobar")
		end

		describe 'モデルのvalidatesテスト' do
			it 'ユーザー名が51文字以上はエラー' do
				@user.name = "a"*51
				expect(@user.valid?).to eq false
			end

			it 'メールアドレスが空だとエラー' do
				@user.email = ""
				expect(@user.valid?).to eq false
			end

			it '小文字大文字問わず、メールアドレスが重複するとエラー' do
				dup_user = @user.dup
				dup_user.email = @user.email.upcase
				@user.save
				expect(dup_user.valid?).to eq false
			end

			it 'メールアドレスが小文字で登録されること' do
				mix_add = "aAD@Abk.jP"
				@user.email = mix_add
				@user.save
				expect(mix_add.downcase == @user.reload.email).to eq true
			end

			it 'passwordとconfirmationが5文字以下だとエラー' do
				@user.password = @user.password_confirmation = "a"*5
				expect(@user.valid?).to eq false
			end
		end

		describe 'ユーザー認証部分のテスト' do
			it 'authenficateがnilだった場合にfalseが返却されること' do
				expect(@user.authenticated?("")).to eq false
			end
		end

		describe 'タスクモデルとのアソシエーションに関するテスト' do
			it 'ユーザー削除と同時にタスクが削除されること' do
				@user.save
				@user.tasks.create!(content: "Lorem ipsum")
				expect{ @user.destroy }.to change{ Task.count }.by(-1)
			end
		end
	end
end
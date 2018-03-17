require 'rails_helper'

RSpec.describe "LoginUsers", type: :request do

	describe "POST #create" do
		it "無効なIDとパスワードでログインするとログイン画面に戻る" do
			post login_path , { params: { session: { email: 'exam@test.jp', password: '', remember_me: '1' }}}
				expect(response).to render_template 'sessions/new'
		end
	end
end
require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do

	describe "sessionヘルパー内のテスト" do
		before do
			@user = build(:michael)
			remember(@user)
		end

		it "current_userが正常に取得できること" do
			expect(@user == current_user).to eq true
		end

		it "remember_digestが異なる場合はcurrent_userはnilになること" do
			@user.update_attribute(:remember_digest, User.digest(User.new_token))
			expect(current_user).to eq nil
		end
	end
end
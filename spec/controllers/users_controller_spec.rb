require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	describe 'GET#new' do

		it '正常レスポンスとなること' do
			get :new
			expect(response).to render_template :new
		end
	end
end

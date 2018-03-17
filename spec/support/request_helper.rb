module RequestHelper

	module Sessions

		def back
			word = "Tatsuro Yamashita"
		end

		# テストユーザーとしてログインする
		def log_in_as(user)
			session[:user_id] = user.id
		end
	end
end


RSpec.configure do |config|
	config.include RequestHelper::Sessions, type: :controller
	config.include RequestHelper::Sessions, type: :request
end
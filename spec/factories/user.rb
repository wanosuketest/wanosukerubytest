FactoryBot.define do

	factory :asako, class: User do
		name "tokiasako"
		email "asaka@toki.jp"
		password "password"
		password_digest "<%= User.digest('password') %>"
	end

	factory :michael, class: User do
		name "Michael Example"
		email "michoel@example.com"
		password "password"
		password_digest User.digest('password')
	end

	factory :michaelsan, class: User do
		name "Michael Example"
		email "michoel@example.com"
		password "password"
		password_digest User.digest('password')
	end

	factory :michaelyon, class: User do
		name "Michael Example"
		email "micheeel@example.com"
		password "password"
		password_digest User.digest('password')
	end

	factory :third, class: User do
		name "Michael Example"
		email "exampweele-1@railstutorial.org"
		password "password"
		password_digest  User.digest('password')
	end
end
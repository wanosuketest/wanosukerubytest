source 'https://rubygems.org'

git_source(:github) do |repo_name|
	repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
	"https://github.com/#{repo_name}.git"
end


ruby '2.5.0'
gem 'rails', '~> 5.1.4'

gem 'pg', '0.20.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt',         '3.1.11'
gem 'rails-controller-testing'
gem 'kaminari', '~> 0.17.0'
gem 'faker',  '1.6.6'
gem 'brakeman'
gem 'rails_best_practices'
gem 'bootstrap-sass'

group :development, :test do
	gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
	gem 'capybara', '~> 2.13'
	gem 'selenium-webdriver'
	gem 'rspec-rails'
	gem 'factory_bot_rails'
	gem 'database_cleaner'
end

group :development do
	gem 'web-console', '>= 3.3.0'
	gem 'listen', '>= 3.0.5', '< 3.2'
	gem 'spring'
	gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
	gem 'pg', '0.20.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# ruby verison 2.4.0
# rails 5.1.5

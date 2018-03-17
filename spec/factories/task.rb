FactoryBot.define do

	factory :most_recent, class: Task do
		name "MyString"
		content "test"
		created_at Time.zone.now
		association :user, factory: :michael
	end

	factory :ants, class: Task do
		name "MyString"
		content "Oh, is that what you want? Because that's how you get ants!"
		created_at 2.years.ago	
		association :user, factory: :third
	end

	factory :bee, class: Task do
		name "MyString"
		content "Oh, is that what you want? Because that's how you get ants!"
		created_at 2.years.ago
		association :user, factory: :michael
	end
end
FactoryBot.define do
	sequence(:email) { |n| 'user#{n}@example.com'}
	
	factory :user do
		email
		password "testingtesting1"
		first_name "Tester"
		last_name "Testington"
		admin false
	end

	factory :admin, class: User do
		email
		password "testingtesting2"
		first_name "Tester"
		last_name "TestingtonII"
		admin true
	end

end
FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password "asdfghjkl"
    password_confirmation "asdfghjkl"
    total_links 0
  end
end

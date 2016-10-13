FactoryGirl.define do
  factory :url do
    target { Faker::Internet.url }
    slug SecureRandom.hex(3)
    frequency 1
    user
  end
end

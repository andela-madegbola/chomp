FactoryGirl.define do
  factory :url do
    target { Faker::Internet.url }
    slug SecureRandom.hex(3)
    clicks 0
    user
  end
end

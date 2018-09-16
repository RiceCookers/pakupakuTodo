FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com"}
    password { "abcdef1234" }
    password_confirmation { "abcdef1234" }
  end
end
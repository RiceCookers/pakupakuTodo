FactoryBot.define do
  factory :task do
    name { "play Game!" }
    state { :opened }
    association :user, factory: :name
  end
end

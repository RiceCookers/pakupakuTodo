FactoryBot.define do
  factory :task, class: Task do
    name { "playGame!" }
    state { :opened }
    association :user, factory: :user
  end
end

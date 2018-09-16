FactoryBot.define do
  factory :admin_user, class: Admin::User do
    email { "admin@sample.co.jp" }
    password { "password1234" }
    password_confirmation { "password1234" }
  end
end

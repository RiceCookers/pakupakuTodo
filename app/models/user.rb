class User < ApplicationRecord
  has_secure_password
  validates :email, :password_confirmation, presence: true

  has_many :tasks
end

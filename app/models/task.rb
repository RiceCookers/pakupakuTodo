class Task < ApplicationRecord
  enum state: { opened: 0, closed: 1 }

  validates :name, :state, presence: true
  belongs_to :user
end

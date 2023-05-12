class School < ApplicationRecord
  has_many :courses
  has_many :batches
  has_many :enrollments
  has_many :users

  scope :mine, ->(user_id) {includes(:users).where(users: { id: user_id }) }

  validates :name, :email, presence: true
  validates :email, uniqueness: true, on: :create
end

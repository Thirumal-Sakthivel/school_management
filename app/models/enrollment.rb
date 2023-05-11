class Enrollment < ApplicationRecord
  belongs_to :school
  belongs_to :course
  belongs_to :batch
  belongs_to :student, class_name: 'User', foreign_key: :student_id

  enum status: { pending: 0, approved: 1, rejected: 2 }

  scope :mine, ->(user_id) { where(student_id: user_id) }
  scope :my_school_entries, ->(school_id) { where(school_id: school_id) }
end

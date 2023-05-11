class Batch < ApplicationRecord
  belongs_to :school
  belongs_to :course

  scope :mine, ->(user_id) { where(student_id: user_id) }
  scope :my_school_entries, ->(school_id) { where(school_id: school_id) }
end

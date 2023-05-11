class Course < ApplicationRecord
  belongs_to :school
  belongs_to :category

  enum course_type: { offline: 0, online: 1 }
end

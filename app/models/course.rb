class Course < ApplicationRecord
  enum course_type: { offline: 0, online: 1 }
end

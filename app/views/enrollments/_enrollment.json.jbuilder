json.extract! enrollment, :id, :enrollment_date, :school_id, :course_id, :batch_id, :student_id, :status, :created_at, :updated_at
json.url enrollment_url(enrollment, format: :json)

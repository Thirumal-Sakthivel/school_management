json.extract! course, :id, :name, :course_type, :fee, :description, :category_id, :school_id, :learn_content, :curriculam, :duration, :hours_per_day, :active, :created_at, :updated_at
json.url course_url(course, format: :json)

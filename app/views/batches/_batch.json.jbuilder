json.extract! batch, :id, :name, :description, :school_id, :course_id, :start_time, :end_time, :active, :created_at, :updated_at
json.url batch_url(batch, format: :json)

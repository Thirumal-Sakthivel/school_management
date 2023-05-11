json.extract! school, :id, :name, :email, :phone_number, :office_phone, :website, :description, :street_address, :city, :state, :country, :pin_code, :delivery_method, :facilities, :active, :created_at, :updated_at
json.url school_url(school, format: :json)

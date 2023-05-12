class Api::SchoolSerializer < ApplicationSerializer
  attributes :name, :email, :phone_number, :office_phone, :website, :description, :street_address,
  :city, :state, :country, :pin_code, :active, :created_at

  def created_at
    object.created_at.strftime('%d %b, %Y %I:%M %p')
  end
end
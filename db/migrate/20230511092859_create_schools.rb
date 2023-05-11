class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone_number
      t.string :office_phone
      t.string :website
      t.text :description
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country
      t.string :pin_code
      t.string :delivery_method
      t.string :facilities
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

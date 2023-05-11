class CreateUserRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_roles do |t|
      t.references :user_id
      t.references :role_id

      t.timestamps
    end
  end
end

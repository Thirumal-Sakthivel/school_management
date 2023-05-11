class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.integer :course_type
      t.decimal :fee
      t.text :description
      t.references :category
      t.references :school
      t.text :learn_content
      t.text :curriculam
      t.string :duration
      t.string :hours_per_day
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

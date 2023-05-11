class CreateEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :enrollments do |t|
      t.datetime :enrollment_date, null: false
      t.references :school
      t.references :course
      t.references :batch
      t.integer :student_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

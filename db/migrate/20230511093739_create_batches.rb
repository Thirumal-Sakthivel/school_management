class CreateBatches < ActiveRecord::Migration[6.1]
  def change
    create_table :batches do |t|
      t.string :name, null: false
      t.text :description
      t.references :school
      t.references :course
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

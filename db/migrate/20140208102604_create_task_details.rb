class CreateTaskDetails < ActiveRecord::Migration
  def change
    create_table :task_details do |t|
      t.integer :bonus
      t.integer :longitude
      t.integer :latitude
      t.datetime :expect_time
      t.string :location

      t.references :task

      t.timestamps
    end
  end
end

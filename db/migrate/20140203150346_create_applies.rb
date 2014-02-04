class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.references :task
      t.references :user

      t.string :state

      t.timestamps
    end
    add_index :applies, :task_id
    add_index :applies, :user_id
  end
end

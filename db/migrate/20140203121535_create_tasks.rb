class CreateTasks < ActiveRecord::Migration
  def change
    create_table(:tasks) do |t|
      t.string :name, :null => false
      t.string :pitch
      t.string :state
    end
  end
end

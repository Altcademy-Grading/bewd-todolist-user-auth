class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :parent_task_id
      t.timestamps
    end
  end
end

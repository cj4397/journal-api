class RemoveIndexFromTasks < ActiveRecord::Migration[7.0]
  def change
     remove_index :tasks, :category_id
  end
end

class RemoveUsersFromTasks < ActiveRecord::Migration[7.0]
  def change
        remove_index :tasks, :users_id
  end
end

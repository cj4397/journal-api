class RemoveUsersIdFromTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :users_id, :integer
  end
end

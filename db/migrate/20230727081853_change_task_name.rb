class ChangeTaskName < ActiveRecord::Migration[7.0]
  def change
     rename_column :tasks, :name, :task
  end
end

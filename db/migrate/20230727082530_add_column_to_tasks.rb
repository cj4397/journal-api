class AddColumnToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :status, :string
    add_column :tasks, :due_date, :date
  end
end

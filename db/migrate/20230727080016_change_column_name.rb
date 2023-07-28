class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
       rename_column :tasks, :task, :details
  end
end

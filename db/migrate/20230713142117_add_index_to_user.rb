class AddIndexToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :token, :string
    add_index :users, :email, unique: true
  end
end

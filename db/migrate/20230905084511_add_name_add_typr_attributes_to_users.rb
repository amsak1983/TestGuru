class AddNameAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    remove_column :users, :name
    add_column :users, :username, :string, null: false
    remove_column :users, :role
    add_column :users, :type, :string, null: false, default: 'User'
  end
end

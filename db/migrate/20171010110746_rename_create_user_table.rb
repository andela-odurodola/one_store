class RenameCreateUserTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_tables, :users
  end
end

class RenameStatusColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :rent_histories, :status, :borrow_status
  end
end

class AddStatusToRentHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :rent_histories, :status, :string
  end
end

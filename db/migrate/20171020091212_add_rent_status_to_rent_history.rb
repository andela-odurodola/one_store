class AddRentStatusToRentHistory < ActiveRecord::Migration[5.1]
  def change
    add_column :rent_histories, :rent_status, :string
  end
end

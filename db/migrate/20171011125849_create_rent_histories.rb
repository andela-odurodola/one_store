class CreateRentHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :rent_histories do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :date_returned
      t.datetime :date_borrowed
      t.timestamps
    end
  end
end

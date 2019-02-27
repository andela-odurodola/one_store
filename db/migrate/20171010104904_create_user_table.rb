class CreateUserTable < ActiveRecord::Migration[5.1]
  def change
    create_table :user_tables do |t|
      t.string :name
      t.text :address
    end
  end
end

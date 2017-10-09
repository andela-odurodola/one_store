class Book < ActiveRecord::Base
  validates :title, :description, :quantity, presence: true
end
class RentHistory < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates_presence_of :user_id, :book_id
end
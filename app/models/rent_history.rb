class RentHistory < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates_presence_of :user_id, :book_id

  def self.save_borrow_history(params)
    RentHistory.find_or_create_by(
      book_id: params[:book_id],
      user_id: params[:user_id]
    ) do |new_history|
      new_history.date_borrowed = DateTime.now
    end
  end

  def self.return_borrowed_book(params)
    rent_book = RentHistory.find_or_create_by(
      book_id: params[:book_id],
      user_id: params[:user_id]
    )
    rent_book.update_columns(date_returned: DateTime.now)
  end
end
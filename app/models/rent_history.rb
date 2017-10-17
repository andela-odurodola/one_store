class RentHistory < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates_presence_of :user_id, :book_id

  def self.save_borrow_history(params)
    rent_book = RentHistory.find_or_initialize_by(
      book_id: params[:book_id],
      user_id: params[:user_id]
    )
    rent_book
  end

  def self.return_borrowed_book(params)
    rented_book = RentHistory.find_or_initialize_by(
      book_id: params[:book_id],
      user_id: params[:user_id]
    )
    rented_book
  end

  def self.confirm_borrow_history(params)
    confirm_book = save_borrow_history(params)
    confirm_book.update_columns(date_borrowed: DateTime.now)
    confirm_book.save
  end

  def self.confirm_return_history(params)
    confirmed_book = return_borrowed_book(params)
    confirmed_book.update_columns(date_returned: DateTime.now)
    confirmed_book.save
    # rent_book = RentHistory.find_or_initialize_by(
    #   book_id: params[:book_id],
    #   user_id: params[:user_id]
    # )
    # rent_book.update_columns(date_returned: DateTime.now)
  end
end
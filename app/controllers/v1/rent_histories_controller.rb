module V1
  class RentHistoriesController < ApplicationController
    before_action :set_book
    before_action :available_book?, only: :borrow
    # Only an admin can confirm borrow and return request
    # How do that
    def borrow
      if available_book?
        RentHistory.find_or_create_by(
          book_id: params[:book_id],
          user_id: current_user.id
        ) do |book_status|
          book_status.status = 'Pending'
        end
        json_response(@book.rent_histories)
      else
        json_response(
          { Message: 'Book is not Available' },
          :bad_request
        )
      end
    end

    def return
      RentHistory.find_or_create_by(
        book_id: params[:book_id],
        user_id: current_user.id
      ) do |book_status|
        book_status.status = 'Pending'
      end
      json_response(@book.rent_histories)
    end

    def update_borrow
      RentHistory.find_by(
        book_id: params[:book_id],
        user_id: current_user.id
      ).update_columns(
        status: params[:status],
        date_borrowed: DateTime.current
      ) && @book.decrement!(:quantity, 1)

      json_response(@book.rent_histories, :created)
    end

    def update_return
      RentHistory.find_by(
        book_id: params[:book_id],
        user_id: current_user.id
      ).update_columns(
        status: params[:status],
        date_returned: DateTime.current
      ) && @book.increment!(:quantity, 1)

      json_response(@book.rent_histories, :created)
    end

    private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def available_book?
      if @book.quantity > 0
        true
      else
        false
      end
    end
  end
end
module Api
  class RentHistoriesController < ApplicationController
    before_action :set_book
    def borrow
      if available_book?
        RentHistory.save_borrow_history(params)
        # && @book.decrement!(:quantity, 1)
        # @book.rent_histories.create(rent_params)
        # @book.rent_histories.update(date_borrowed: DateTime.now)
        # byebug
        json_response(@book.rent_histories)
      else
        json_response(@book.rent_histories.errors.full_messages, :bad_request)
      end
    end

    def return
      RentHistory.return_borrowed_book(params)
      json_response(@book.rent_histories)
    end

    def update_borrow
      RentHistory.confirm_borrow_history(params) && @book.decrement!(:quantity, 1)
      json_response(@book.rent_histories, :created)
    end

    def update_return
      RentHistory.confirm_return_history(params) && @book.increment!(:quantity, 1)
      json_response(@book.rent_histories, :created)
    end

    private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def available_book?
      return true if @book.quantity > 0
    end

    # def rent_params
    #   params.permit(:user_id, :book_id)
    # end
  end
end
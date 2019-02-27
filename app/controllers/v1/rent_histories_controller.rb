module V1
  class RentHistoriesController < ApplicationController
    before_action :set_book
    before_action :is_admin?, except: [:borrow, :return]
    # Only an admin can confirm borrow and return request
    # How do that
    def borrow
      if available_book?
        current_user.rent_histories.create!(history_params)
        # RentHistory.find_or_create_by(
        #   book_id: params[:book_id],
        #   user_id: current_user.id
        # ) do |book_status|
        #   book_status.borrow_status = 'Pending'
        # end
        json_response(@book.rent_histories)
      else
        json_response(
          { Message: 'Book is not Available' },
          :bad_request
        )
      end
    end

    def return
      return_book = current_user.rent_histories.find_by(book_id: params[:book_id])
      if return_book
        return_book.status = :pending
        return_book.save
        json_response(@book.rent_histories)
      else
        json_response(Message.not_found('Book'), :not_found)
      end
    end

    # RentHistory.find_or_create_by(
      #   book_id: params[:book_id],
      #   user_id: current_user.id
      # ) do |book_status|
      #   book_status.rent_status = 'Pending'
      # end

    def update_borrow
      current_user.rent_histories.find_by(
        book_id: params[:book_id]
      ).update_columns(
        status: params[:status],
        date_borrowed: DateTime.current
      ) && @book.decrement!(:quantity, 1)

      json_response(@book.rent_histories, :created)
    end

    def update_return
      # current_user.rent_histories.find_by(
      #   book_id: params[:book_id]
      # ).update_columns(
      #   status: params[:status],
      #   date_returned: DateTime.current
      # ) && @book.increment!(:quantity, 1)

      return_status = current_user.rent_histories.find_by(
        book_id: params[:book_id]
      )

      if params[:status] == "accept"
        return_status.update_columns(
          status: params[:status],
          date_returned: DateTime.current
        ) && @book.increment!(:quantity, 1)
        json_response(@book.rent_histories, :created)
      else
        return_status.update_columns(
          status: params[:status]
        )
        response = { message: I18n.t('rent_histories.return_error'), uodate: current_user.rent_histories }
        json_response(response, :no_content)
      end
    end

    private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def available_book?
      @book.quantity > 0
    end

    def history_params
      params.permit(:book_id, :status, :date_returned, :date_borrowed)
    end
  end
end
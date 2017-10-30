module V1
  class ReviewsController < ApplicationController
    before_action :set_book

    def comment
      current_user.reviews.create!(review_params)
      json_response(@book.reviews.last, :created)
    end

    private

    def set_book
      @book = Book.find(params[:book_id])
    end

    def review_params
      params.permit(:book_id, :comment)
    end
  end
end
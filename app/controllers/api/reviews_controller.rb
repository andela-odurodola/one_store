module Api
  class ReviewsController < ApplicationController
    before_action :set_book

    def comment
      Review.find_or_create_by(
        book_id: params[:book_id],
        user_id: params[:user_id]
      ) do |user_review|
        user_review.comment = params[:comment]
      end
      json_response(@book.reviews, :created)
    end

    private
    def set_book
      @book = Book.find(params[:book_id])
    end
  end
end
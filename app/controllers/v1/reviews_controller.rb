module V1
  class ReviewsController < ApplicationController
    before_action :set_book

    def comment
      Review.find_or_create_by(
        book_id: @book.id,
        user_id: current_user.id
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
module Api
  class FavouritesController < ApplicationController
    before_action :set_book
    def create
      Favourite.find_or_create_by(
        book_id: params[:book_id],
        user_id: params[:user_id]
      )
      json_response(@book.favourites)
    end

    def retrieve
      @user = User.find(params[:user_id])
      json_response(@user.favourite_books)
    end

    private
    def set_book
      @book = Book.find(params[:book_id])
    end
  end
end
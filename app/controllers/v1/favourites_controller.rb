module V1
  class FavouritesController < ApplicationController
    before_action :set_book, only: :create

    def create
      Favourite.find_or_create_by(
        book_id: @book.id,
        user_id: current_user.id
      )

      response = { message: I18n.t('favourites.book_added'), fav: current_user.favourites.last }
      json_response(response, :created)
    end

    def index
      json_response(current_user.favourite_books)
    end

    private
    def set_book
      @book = Book.find(params[:book_id])
    end

    def fav_params
      params.permit(:book_id)
    end
  end
end
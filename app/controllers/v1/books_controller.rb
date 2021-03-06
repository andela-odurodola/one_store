module V1
  class BooksController < ApplicationController
    skip_before_action :authorize_request, only: [:index]
    before_action :set_book, only: [:update, :show, :destroy]
    before_action :is_admin?, except: [:index, :show]

    def index
      @books = Book.all
      json_response(@books)
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        json_response(@book, :created)
      else
        json_response(@book.errors.full_messages, :bad_request)
      end
    end

    def update
      if @book.update(book_params)
        head :no_content
      else
        json_response(@book.errors.full_messages, :bad_request)
      end
    end

    def show
      json_response(@book)
    end

    def destroy
      @book.destroy
      head :no_content
    end

    private

    def book_params
      params.permit(:title, :description, :quantity)
    end

    def set_book
      @book = Book.find(params[:id])
    end
  end
end
class BooksController < ApplicationController
  before_action :set_book, only: [:update, :show]
  def index
    @books = Book.all
    json_response(@books)
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      json_response(@book, :created)
    else
      flash[:error] = @book.errors.full_messages
    end
  end

  def update
    if @book.update(book_params)
      json_response(@book, :updated)
    else
      flash[:error] = @book.errors.full_messages
    end
  end

  def show
    json_response(@book)
  end

  def destroy
    @book.destroy
    json_response(:ok)
  end

  private

  def book_params
    params.permit(:title, :description, :quantity)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy, validate: true
  has_many :favourites, dependent: :destroy, validate: true
  has_many :rent_histories, dependent: :destroy, validate: true

  has_many :favourite_books, through: :favourites, source: :user
  has_many :review_books, through: :reviews, source: :user
  has_many :rented_books, through: :rent_histories, source: :user

  validates :title, :description, :quantity, presence: true
end
class User < ApplicationRecord
  has_many :reviews, dependent: :destroy, validate: true
  has_many :favourites, dependent: :destroy, validate: true
  has_many :rent_histories, dependent: :destroy, validate: true

  has_many :favourite_books, through: :favourites, source: :book
  has_many :review_books, through: :reviews, source: :book
  has_many :rented_books, through: :rent_histories, source: :book

  validates :name, :email, :password, :address, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
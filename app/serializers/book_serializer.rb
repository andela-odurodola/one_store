class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :quantity, :created_at, :updated_at

  has_many :reviews
  has_many :favourites
end
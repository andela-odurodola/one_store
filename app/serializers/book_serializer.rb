class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :quantity, :created_at, :updated_at
end
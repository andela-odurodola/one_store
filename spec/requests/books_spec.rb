require 'rails_helper'

RSpec.describe "One Store", :type => :request do
  let!(:book) { create(:book)}
  let(:book_id) { book.id }

  describe 'GET /books' do
    before { get '/books'}

    context 'when books are requested' do
      it 'return books' do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
      end

      it 'returns a status' do
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'GET /books/:id' do
    before { get "/books/#{book_id}" }

    context 'when a book exist' do
      it 'return a book' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(book_id)
      end

      it 'returns a status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when a book does not exist' do
      let (:book_id) { 10 }

      it 'returns an error message' do
        expect(response.body).to match(/Couldn't find Book/)
      end

      it 'returns a status' do
        expect(response).to have_http_status(404)
      end
    end
  end

end
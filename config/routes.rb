Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  namespace :api do
    get '/favourites', to: 'favourites#retrieve'
    resources :users
    resources :books do
      post '/borrow', to: 'rent_histories#borrow'
      post '/return', to: 'rent_histories#return'
      put '/borrow/rent_id', to: 'rent_histories#update_borrow'
      put '/return/rent_id', to: 'rent_histories#update_return'
      post '/review', to: 'reviews#comment'
      post '/favourite', to: 'favourites#create'
    end
  end
end

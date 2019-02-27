Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  post '/signup', to: 'users#create'
  post '/login', to: 'authentication#authenticate'

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    get '/favourites', to: 'favourites#index'
    resources :books do
      post '/borrow', to: 'rent_histories#borrow'
      post '/return', to: 'rent_histories#return'
      put '/borrow', to: 'rent_histories#update_borrow'
      put '/return', to: 'rent_histories#update_return'
      post '/review', to: 'reviews#comment'
      post '/favourite', to: 'favourites#create'
    end
  end
end

Rails.application.routes.draw do
  resources :bingo_numbers
  resources :bingo_cards
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

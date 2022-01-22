Rails.application.routes.draw do
  resources :bingo_numbers
  resources :bingo_cards do
    collection do
      delete :destroy_all
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end

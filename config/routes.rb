Rails.application.routes.draw do
  resources :users # crud de users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "transactions#index" # get "/" => "transaction#index" # lo mismo
  post "/transactions" => "transactions#create", as: "transactions"
  get "/nueva" => "transactions#new", as: "new_transaction"
  get "/grats" => "transactions#success"
end

Rails.application.routes.draw do
  resources :surveys, only: %i(index show update)
  root to: "surveys#index"
end

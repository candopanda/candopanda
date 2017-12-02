Rails.application.routes.draw do
  resources :surveys, only: %i(index create show update)
  root to: "surveys#index"
end

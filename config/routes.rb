Rails.application.routes.draw do
  resources :surveys, only: %i(show update)
end

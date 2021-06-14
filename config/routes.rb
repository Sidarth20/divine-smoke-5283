Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :plots, only: [:index, :show]
  resources :plant_plots, only: [:index, :destroy]
  resources :gardens, only: [:show]
end

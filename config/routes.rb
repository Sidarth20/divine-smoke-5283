Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :plots, only: [:index, :show] do
    resources :plants, only: [:destroy], controller: :plant_plots
  end
  resources :gardens, only: [:show]
end

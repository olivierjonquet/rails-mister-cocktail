Rails.application.routes.draw do
  resources :cocktails, only: [:new, :create, :show, :index] do
    resources :doses, only: [:new, :create, :destroy]
  end
root 'cocktails#index'
end


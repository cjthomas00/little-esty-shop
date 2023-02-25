Rails.application.routes.draw do
  
  resources :merchant do
    resources :items, controller: "merchant_items" 
    resources :invoices
    resources :dashboard, only: [:index]
  end

  # resources :admin, controller: 'admin/dashboards', only: :index
  get '/admin', to: 'admin/dashboards#index'

  #/admin/merchants

  namespace :admin do 
    resources :merchants, only: [:index, :show, :edit, :update]
    resources :invoices, only: :index
  end
end

Rails.application.routes.draw do
  
  resources :merchants do
    resources :items, controller: "merchant_items" 
    resources :invoices, controller: "merchant_invoices" 
    resources :dashboard, only: [:index]
  end

  # resources :admin, controller: 'admin/dashboards', only: :index
  get '/admin', to: 'admin/dashboards#index'

  #/admin/merchants

  namespace :admin do 
    resources :merchants, only: [:index, :show, :new, :edit, :update, :create]
    resources :invoices, only: [:index, :show, :update]
  end
end

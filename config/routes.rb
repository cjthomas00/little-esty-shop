Rails.application.routes.draw do
  
  root to: "application#welcome"

  resources :merchants do
    resources :items, controller: "merchant_items" 
    resources :invoices, controller: "merchant_invoices" 
    resources :dashboard, only: [:index]
  end

  resources :admin, controller: 'admin/dashboards', only: :index
 
  namespace :admin do 
    resources :merchants, only: [:index, :show, :new, :edit, :update, :create]
    resources :invoices, only: [:index, :show, :update]
  end
end

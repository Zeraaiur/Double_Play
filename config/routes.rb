Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  get 'items/new'
  get 'items/create'
  get 'items/edit'
  get 'items/update'
  get 'items/destroy'
  get 'booking/index'
  get 'booking/show'
  get 'booking/new'
  get 'booking/create'
  get 'booking/edit'
  get 'booking/update'
  get 'booking/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items do
    resources :bookings
   end

end

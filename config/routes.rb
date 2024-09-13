Rails.application.routes.draw do
  devise_for :admins
  get "facilities/index"
  devise_for :users
  
  resources :hotels do
    resources :rooms, only: [:index, :show]
    resources :opinions, only: [:index, :create]
  end

  resources :users do
    resources :reservations, only: [:index, :show]
  end

  resources :payments, only: [:create, :update]
  resources :opinions, only: [:index, :show, :destroy]

  # Ruta raíz
authenticated :user do
  root to: 'hotels#index', as: :authenticated_root
end
get "admin/dashboard", to: 'admin#index', as: :admin_dashboard_index

devise_scope :user do
unauthenticated do
  root to: 'devise/sessions#new', as: :unauthenticated_root
end
end

devise_for :users, skip: [:sessions]
as :user do
  delete 'users/sign_out' => 'devise/sessions#destroy'
end





#get "admin/hotel_management", to: 'admin#hotel_management', as: :admin_hotel_management
get "admin/room_management", to: 'admin#room_management', as: :admin_room_management
get "admin/hotels", to: 'hotel_management#index', as: :admin_hotels



  # Health check y PWA routes
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get 'facilities', to: 'facilities#index', as: 'facilities'
end

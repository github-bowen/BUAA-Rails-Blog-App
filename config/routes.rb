Rails.application.routes.draw do

  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  get '/422', to: 'errors#unprocessable'

  # devise_for :users
  devise_scope :user do
    #   get '/users/sign_in' => 'users/sessions#new'
    get '/users/sign_out' => 'users/sessions#destroy'
    get '/users/edit_avatar' => 'users/registrations#edit_avatar', as: :edit_avatar
    #   get '/users/edit' => 'users/registrations#edit'
    #   get '/users/sign_up' => 'users/registrations#new'
    #   get '/users/password/new' => 'users/passwords#new'
    #   post '/users/update' => 'users/registrations#update'
  end
  devise_for :users, controllers: {
    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
    :passwords => 'users/passwords'
  }

  root 'blogs#index'
  get 'about' => 'home#about'
  # resources :tourist_routes
  resources :blogs do
    resources :comments
  end

  scope :users do
    get 'change_authority' => 'home#change_authority', as: :change_authority
    post 'change_authority' => 'home#change_authority', as: :commit_change_autority
    get 'tourist_routes' => 'home#tourist_routes', as: :tourist_routes
    match '/:id/details' => 'home#details', via: [:get], as: :user_details
    get 'current_user_details' => 'home#current_user_details', as: :current_user_details
    resources :tourist_routes
  end

  scope :admin do
    resources :hotels
    resources :room_types
    resources :airline_companies
    resources :air_routes
    get 'user_list' => 'admin#user_list', as: :admin_user_list
    match 'destroy_user/:id' => 'admin#destroy_user', :via => :delete, as: :admin_destroy_user
    get 'config_models' => 'admin#config_models', as: :admin_crud
  end

end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

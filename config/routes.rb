RinconOrganico::Application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  root :to => 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resource :home
  resources :products, path: 'productos', only: :show
  resources :categories, path: 'categorias', only: [:index, :show]
  resources :certifications, path: 'certificaciones', only: [:index, :show]
  resources :testimonies, path: 'testimonios', only: [:index, :show]
  resources :caterings, path: 'catering', only: [:index, :show]
  resources :bars, path: 'bar', only: [:index, :show]
  resources :posts, path: 'notas', only: [:index, :show]
  resources :recipes, path: 'recetas', only:[:index, :show]
  resources :producers, path: 'productores', only:[:index, :show]
  resources :media, path: 'prensa', only: [:index, :show]
  resources :orders, only: [:new, :create]
  get '/orders/success', to: 'orders#success', as: 'orders_success'
  resources :newsletter_subscriptions, only: [:create, :new]
  # resources :carts, only: [:show]
  get '/cart', to: 'carts#show', as: 'current_cart' 
  put '/cart', to: 'carts#update', as: 'update_current_cart' 
  resources :cart_items, only: [:create, :destroy]


  get 'prensa/detalle', to: 'info#prensa_detalle'
  get 'contacto', to: 'contact#new', as: 'contact'
  post 'contacto', to: 'contact#create', as: 'contact'

  %w[recetas promos delivery almacen exportacion servicios prensa quienes certificaciones testimoniales].each do |page|
    get page, :controller => 'info', :action=>page
  end

  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  end

end

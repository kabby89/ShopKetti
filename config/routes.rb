Shopketti::Application.routes.draw do
  get "sessions/new"
  devise_for :users
  root 'static_home_page#index'
  resources :products 

  namespace :creator do 
    resources :dashboards, :only => [:index]
    resource :management, :only => [:show]
    namespace :management do
      resources :profiles, :only => [:show, :edit, :update]
      resources :orders
      resources :my_returns, :only => [:index, :create]
    end
  end
  namespace :market do
    resources :stores, :only => [:index, :show]
    resources :products, :only => [:index]
    namespace :stores do
      resources :products, :only => [:index, :show]
    end
  end
  
  # This is to redirect after sign up to the WePay registration
  resources :wepays, :only => [:index]
  match 'wepays/:action/(/:user_id)', :controller => 'wepays', via: :all

  namespace :retailer do
    resources :dashboards, :only => [:index]
    namespace :managements do
      resources :orders, :only => [:index]
      resources :profiles, :only => [:index]
    end
  end

  resources :static_home_page, :only => [:index]
  resources :registration_splitter, :only => [:index]
  resources :order_items, :only => [:create, :update, :destroy]
  resource :cart, :only => [:show]
  match 'carts/:action/(/:user_id)', :controller => 'carts', via: :all
  post 'users' => 'devise/users#create'
  get 'users' => 'devise/users'


  devise_for :buyers, :class_name => 'User', :controllers => {:registrations => "buyer/registrations", :sessions => 'main' } do
    get   "buyer/registration/sign_up" => "buyer/registrations#new", :as => :buyer_signup
    get   "private_customer/sign_in" => "main#index", :as => :private_customer_signin
  end

end

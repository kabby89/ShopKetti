Shopketti::Application.routes.draw do
  # get "order_items/create"
  # get "order_items/update"
  # get "order_items/destroy"
  # get "carts/show" => "cart#show"
  devise_for :users
  root 'static_home_page#index'
  resources :products 
  namespace :creator do 
    resources :dashboards, :only => [:index]
    resources :management, :only => [:index, :show]
    namespace :management do
      resources :profiles, :only => [:show]
    end
  end
  namespace :market do
    resources :stores, :only => [:index, :show]
    namespace :stores do
      resources :products, :only => [:index, :show]
    end
  end
  namespace :carts do
    resources :checkouts, :only => [:index]
  end
  resources :static_home_page, :only => [:index]
  resources :registration_splitter, :only => [:index]
  resources :order_items, :only => [:create, :update, :destroy]
  resource :cart, :only => [:show]

   devise_for :buyers, :class_name => 'User', :controllers => {:registrations => "buyer/registrations", :sessions => 'main' } do
    get   "buyer/registration/sign_up" => "buyer/registrations#new", :as => :buyer_signup
    get   "private_customer/sign_in" => "main#index", :as => :private_customer_signin
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

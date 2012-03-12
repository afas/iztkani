Iztkani::Application.routes.draw do

  resources :likes, :only => [ :create, :update ]

  resources :product_images, :only => [ :destroy ]

  get "users/edit"
  put "users/update"

  devise_for :users
  as :user do
    get 'sign_in', :to => 'devise/sessions#new'
    get 'sign_out', :to => 'devise/sessions#destroy'
  end

  resources :feedbacks, :except => [:edit, :update]

  resources :orders

  match '/add_to_cart/:id', :to => 'store#add_to_cart', :as => 'add_to_cart'
  match '/remove_from_cart/:id', :to => 'store#remove_from_cart', :as => 'remove_from_cart'
  match '/empty_cart', :to => 'store#empty_cart', :as => 'empty_cart'

  resources :special_offers, :except => [:index, :show]

  resources :categories, :except => [:show] do
    get :image, :on => :member
    resources :sub_categories, :except => [:show] do
      get :image, :on => :member
      resources :products do
        get :image, :on => :member
      end
    end
  end

  resources :papers
  #resources :paper_images, :only => [ :destroy ]
  resources :paper_images do
    member do
      get :update_position
    end
  end

  resources :statics, :except => [:index, :new, :create, :destroy]

  root :to => "welcome#index"

  match '/:url_part', :to => 'statics#show'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

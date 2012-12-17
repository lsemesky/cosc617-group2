AssociationOfZoo::Application.routes.draw do
  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :friendships
  resources :animals
  resources :zoos
  
  resources :zoos do
    resources :animals
  end

root :to => "sessions#login"

#match "animals", :to => "animals#index"
match "search", :to => "search#index"
match "signup", :to => "users#register"
match "login", :to => "sessions#login"
match "logout", :to => "sessions#logout"
match "home", :to => "sessions#home"
match "show", :to => "users#show"
match "profile", :to => "users#create"
match "show", :to => "users#show"
match "edit", :to => "users#edit"
match "setting", :to => "sessions#setting"
match "tos", :to => "users#tos"
match "animals/mates", :to => "animals#mates"
match 'userslist', :to => "users#index"

  get 'mates' => 'animals#mates', :as => 'mates'
  
  post "sessions/login_attempt"
  get "users/register"
  post "users/unfollow"
  post "users/follow"
  get "users/add"
  post "users/add"
  get "users/follow"
  get "users/unfollow"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

Musicmindbeta::Application.routes.draw do

  resources :user_access_requests

  resources :album_tracks
  
  resources :albums

  match 'download/:id' =>  'user_song_uploads#download', :as => :download

  resources :song_up_votes, :only => [:create, :destroy]

  match "ms_listen_increment.json" => "master_songs#increment"

  match "create_listen.json" => "song_listens#create"

  resources :searches

  resources :events

  resources :orders

  resources :line_items

  resources :carts

  resources :master_song_relationships, :only => [:create, :destroy] do
    member do
      put :add_favorite_msr
    end
  end

  devise_for :users, :controllers => { :registrations => "registrations", omniauth_callbacks: "omniauth_callbacks" }

  match "discover" => "master_songs#index", :as => :discover

  resources :master_song_comments

  resources :master_songs do
    collection do
     get :most_upvoted, :trending, :free, :most_listened_to, :newly_added
    end
    member do
      get :master_song_owners
    end
  end

  match "favorited" => "user_song_uploads#favorited", :as => :user_library_favorited

  match "your_fan_bases" => "fan_bases#your_fan_bases", :as => :your_fan_bases

  match "yourlibrary" => "user_song_uploads#show", :as => :user_library

  match "recentlyplayed" => "user_song_uploads#recently_played", :as => :user_library_recently_played
  
  
  resources :user_song_uploads do
    collection do
      get :library_search
    end
    member do 
      put :add_favorite_usu
    end
  end



 
  resources :fan_bases do
    member do
      get :fan_base_followers, :recently_added_music, :unreleased_songs, :your_fan_bases
    end
    collection do
      get :shuffle
    end
    resources :labels
  end
  resources :fan_relationships, :only => [:create, :destroy]

  get "pages/about"

  get "pages/help"

  get "pages/contact"

  get "pages/recruiting"

  get "pages/artist_info"


  match "activityfeed" => "users#index", :as => :activity_feed

  match "notifications" => "users#notifications", :as => :your_notifications

  devise_for :users
  resources :users do
    member do
      get :following, :followers, :fan_base_following, :searching, :notifications, :mark_read
    end
  end
  
  resources :pages
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]





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
  root :to => 'master_songs#index'


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
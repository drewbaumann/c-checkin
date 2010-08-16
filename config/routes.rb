ActionController::Routing::Routes.draw do |map|
  map.resources :members
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :users
  map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route
  #map.root :controller => 'members', :action => 'index'
end

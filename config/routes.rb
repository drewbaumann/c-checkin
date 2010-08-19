ActionController::Routing::Routes.draw do |map|
  map.resources :members
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :users
  # map.resources :visits
  map.resource :checkin, :controller => 'visits', :only => [:new,:create]
  map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route
  #map.root :controller => 'members', :action => 'index'
end

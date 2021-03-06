ActionController::Routing::Routes.draw do |map|
  map.resources :members
  map.resources :plans
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :users
  # map.resources :visits
  map.resource :visit, :controller => 'visits', :only => [:new,:create]
  # map.resource :visualization, :controller => 'members', :only => [:time_visual]
  map.members_visual 'visuals/checkins/', :controller => 'members', :action => 'visual'
  map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route
  #map.root :controller => 'members', :action => 'index'
end

ActionController::Routing::Routes.draw do |map|
  map.stylesheet  "stylesheets/:id.css",            :controller => "stylesheets", :action => "show"
  
  # Resources
  map.namespace   :admin do |admin|
    admin.resources :posts
    admin.resource  :preferences
  end
  
  map.resources   :posts  
  map.resources   :users
  map.resource    :session
  map.root        :posts
  
  # Named routes
  map.admin       '/admin',                         :controller => "admin/posts"
  map.signup      '/signup',                        :controller => 'users', :action => 'new'
  map.login       '/login',                         :controller => 'sessions', :action => 'new'
  map.logout      '/logout',                        :controller => 'sessions', :action => 'destroy'
  
  # Admin area
  map.namespace :admin do |admin|
    admin.resources :posts
  end
end

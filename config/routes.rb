ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  map.root :controller => "home"

  map.helper '/helpers/:id', :controller => 'helper', :action => 'helper'
  map.user_method '/user/:action', :controller => 'user'

  map.with_options :controller => 'tutorials' do |r|
  end


  map.with_options :controller => 'connect' do |r|
    r.connection_required '/connect', :action => 'connection_required'
    r.logout '/connect/logout', :action => 'logout'
    r.login '/connect/login', :action => 'login'
    r.uninstall '/connect/uninstall', :action => 'uninstall'
    r.publish_user_actions '/connect/publish-user-actions', :action => 'publish_user_actions'
    r.invite_friends '/connect/invite-friends', :action => 'invite_friends'
  end

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

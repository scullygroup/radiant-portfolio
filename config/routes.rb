ActionController::Routing::Routes.draw do |map|

  map.connect 'projects', :controller => "projects", :action => "index"
  map.connect 'project/:id', :controller => "projects", :action => "show"
  map.connect 'portfolio_image/:id', :controller => "projects", :action => "image"
  
  map.resources :projects
  
  map.namespace(:admin, :controller => 'projects') do |admin|
    admin.project_index           'projects',             :action => 'index'
    admin.project_new             'projects/new',         :action => 'new'
    admin.project_create          'projects/create',      :action => 'create'
    admin.project_show            'projects/:id',    :action => 'show'      
    admin.project_edit            'projects/:id/edit',    :action => 'edit'
    admin.project_update          'projects/:id/update',  :action => 'update'
    admin.project_updatepos       'projects/:id/update_positions',  :action => 'update_positions'
    admin.project_remove          'projects/:id/remove',  :action => 'destroy'
  end
  
  map.namespace(:admin, :controller => 'portfolio_images') do |admin|
    admin.image_index           'portfolio_images',             :action => 'index'
    admin.image_new             'portfolio_images/new',         :action => 'new'
    admin.image_create          'portfolio_images/create',      :action => 'create'
    admin.image_show            'portfolio_images/:id',    :action => 'show'   
    admin.image_edit            'portfolio_images/:id/edit',    :action => 'edit'
    admin.image_update          'portfolio_images/:id/update',  :action => 'update'   
    admin.image_remove          'portfolio_images/:id/remove',  :action => 'destroy'
  end
  
  map.namespace(:admin, :controller => 'tags') do |admin|
    admin.tag_index           'tags',             :action => 'index'
    admin.tag_new             'tags/new',         :action => 'new'
    admin.tag_create          'tags/create',      :action => 'create'
    admin.tag_show            'tags/:id',         :action => 'show'   
    admin.tag_edit            'tags/:id/edit',    :action => 'edit'
    admin.tag_update          'tags/:id/update',  :action => 'update'
    admin.tag_remove          'tags/:id/remove',  :action => 'destroy'
  end
end
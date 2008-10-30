# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PortfolioExtension < Radiant::Extension
  version "1.0"
  description "A Radiant extension that allows you to manage a portfolio gallery"
  url "http://www.scullytown.com"
  
  define_routes do |map|
    
    #This links to an xml file listing of all the projects, defined in the extension tags
    #map.connect 'projects', :url => '/projects', :controller => "site", :action => "show_page"
    map.connect 'projects', :controller => "projects", :action => "index"
    map.connect 'project/:id', :controller => "projects", :action => "show"
    map.connect 'image/:id', :controller => "projects", :action => "image"
    
    map.resources :projects
    #
    #  TODO map project views to xml just like I did for ACM, use new projects_controller.rb and create a .rxml view 
    #
    
    map.with_options(:controller => 'admin/projects') do |project|
      project.project_index           'admin/projects',             :action => 'index'
      project.project_show            'admin/projects/show/:id',    :action => 'show'   
      project.project_new             'admin/projects/new',         :action => 'new'
      project.project_create          'admin/projects/create',      :action => 'create'   
      project.project_edit            'admin/projects/edit/:id',    :action => 'edit'
      project.project_update          'admin/projects/update/:id',  :action => 'update'
      project.project_updatepos       'admin/projects/update_positions/:id',  :action => 'update_positions'
      project.project_remove          'admin/projects/remove/:id',  :action => 'destroy'
    end
    
    map.with_options(:controller => 'admin/images') do |image|
      image.image_index           'admin/images',             :action => 'index'
      image.image_show            'admin/images/show/:id',    :action => 'show'   
      image.image_new             'admin/images/new',         :action => 'new'
      image.image_create          'admin/images/create',      :action => 'create'
      image.image_edit            'admin/images/edit/:id',    :action => 'edit'
      image.image_update          'admin/images/update/:id',  :action => 'update'   
      image.image_remove          'admin/images/remove/:id',  :action => 'destroy'
    end
    
    map.with_options(:controller => 'admin/tags') do |tag|
      tag.tag_index           'admin/tags',             :action => 'index'
      tag.tag_show            'admin/tags/show/:id',    :action => 'show'   
      tag.tag_new             'admin/tags/new',         :action => 'new'
      tag.tag_create          'admin/tags/create',      :action => 'create'
      tag.tag_edit            'admin/tags/edit/:id',    :action => 'edit'
      tag.tag_update          'admin/tags/update/:id',  :action => 'update'
      tag.tag_remove          'admin/tags/remove/:id',  :action => 'destroy'
    end
  end
  
  def activate
    admin.tabs.add "Portfolio", "/admin/projects", :after => "Layouts", :visibility => [:all]
    Page.send :include, PortfolioTags
  end
  
  def deactivate
    # admin.tabs.remove "Portfolio"
  end
  
end
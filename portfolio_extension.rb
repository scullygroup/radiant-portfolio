# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PortfolioExtension < Radiant::Extension
  version "2.0"
  description "A Radiant extension that allows you to manage a portfolio gallery"
  url "http://www.scullytown.com"
  
  def activate
    tab 'Projects' do
      #add_item "Projects", "/admin/projects"
      add_item "Add New Project", '/admin/projects/new'
      add_item "Show All Tags", '/admin/tags'
      add_item "Add New Tag", '/admin/tags/new'
    end
    Page.send :include, PortfolioTags
    NoCachePage
  end
  
  def deactivate
    # admin.tabs.remove "Portfolio"
  end
  
end
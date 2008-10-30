module PortfolioTags
  include Radiant::Taggable
  
  ###############################################################################################
  #
  # Not sure any of this needs to be used since projects_controller.rb now serves the pages
  #
  ###############################################################################################
  
  tag 'projects' do |tag|
    tag.expand
  end
          
  tag 'projects:each' do |tag|
    result = []
    Project.find(:all, :order => 'title ASC').each do |project|
      tag.locals.project = project
      result << tag.expand
    end
    result
  end
  
  tag 'images' do |tag|
    tag.expand
  end
  
  tag 'images:each' do |tag|
    result = []
      project = tag.locals.project
      project.images.each do |image|
        tag.locals.image = image
        result << tag.expand
      end
    result
  end
  
  tag 'projects:each:title' do |tag|
    project = tag.locals.project
    %{#{project.title}}
   end
  
   tag 'projects:each:body' do |tag|
     project = tag.locals.project
     %{#{project.body}}
  end

  tag 'images:each:thumb' do |tag|
      image = tag.locals.image
      %{#{image.location_relative_path("thumb")}}
  end
  
  tag 'images:each:medium' do |tag|
      image = tag.locals.image
      %{#{image.location_relative_path("medium")}}
  end
  
  tag 'images:each:image' do |tag|
      image = tag.locals.image
      %{#{image.location_relative_path}}
  end
  
end
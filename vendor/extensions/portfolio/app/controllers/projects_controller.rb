class ProjectsController < ApplicationController
  
  no_login_required
  radiant_layout 'Project'
  
  def index
      @projects = Project.find(:all)
      render :layout => false
    end
  
  def show
    @project = Project.find(params[:id])
    
    @prev ||= Project.find(:first, :conditions => ["id < ?", params[:id]], :order => 'id DESC')
    @next ||= Project.find(:first, :conditions => ["id > ?", params[:id]], :order => 'id ASC')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end
  
  def image
    @project = Project.find(params[:id])
    render :layout => false
  end
  
end

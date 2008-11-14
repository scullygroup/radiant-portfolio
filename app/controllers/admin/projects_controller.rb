#class Admin::ProjectsController < ApplicationController
class Admin::ProjectsController < Admin::AbstractModelController
 #model_class Project
  
  def index
    @projects = Project.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end
  
  def show
    @project = Project.find(params[:id])
    @image = Image.new(params[:image])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  def new
    @project = Project.new
    #@image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        flash[:notice] = 'Project was successfully created.'
        format.html { redirect_to('/admin/projects') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    #params[:project][:tag_ids] ||= []
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to('/admin/projects') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to('/admin/projects') }
      format.xml  { head :ok }
    end
  end
  
  def update_positions
    @project = Project.find(params[:id])
    @project.images.each do |image|
      image.position = params['image-list'].index(image.id.to_s) + 1 
      image.save
    end
    render :nothing => true 
  end
  
end
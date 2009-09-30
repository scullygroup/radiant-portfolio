class Admin::ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @project = Project.find(params[:id])
    @image = PortfolioImage.new(params[:image])
    
    respond_to do |format|
      format.html
    end
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html
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
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to('/admin/projects') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to('/admin/projects') }
    end
  end
  
  def update_positions
    @project = Project.find(params[:id])
    @project.portfolio_images.each do |image|
      image.position = params['image-list'].index(image.id.to_s) + 1 
      image.save
    end
    render :nothing => true 
  end
  
end
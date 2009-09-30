class Admin::PortfolioImagesController < ApplicationController
  
  def index
    @images = PortfolioImage.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @image = PortfolioImage.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @image = PortfolioImage.new
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @image = PortfolioImage.find(params[:id])
  end
  
  def create
    @image = PortfolioImage.new(params[:image])
    
    respond_to do |format|
      if @image.save
        flash[:notice] = 'Portfolio image was successfully created.'
        format.html { redirect_to :back }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @image = PortfolioImage.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        flash[:notice] = 'Portfolio image was successfully updated.'
        format.html { redirect_to(@image) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @image = PortfolioImage.find(params[:id])
    @image.destroy

    respond_to do |format|
      flash[:notice] = 'Portfolio image was successfully deleted.'
      format.html { redirect_to :back }
    end
  end
  
end

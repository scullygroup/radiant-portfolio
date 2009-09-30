class Admin::TagsController < ApplicationController
  
  def index
    @tags = Tag.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @tag = Tag.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  def new
    @tag = Tag.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      if @tag.save
        flash[:notice] = 'Tag was successfully created.'
        format.html { redirect_to('/admin/tags') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        flash[:notice] = 'Tag was successfully updated.'
        format.html { redirect_to('/admin/tags') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      flash[:notice] = 'Tag was successfully deleted.'
      format.html { redirect_to('/admin/tags') }
    end
  end
end

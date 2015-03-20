class PhotosController < ApplicationController
  def new

  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = "Photo added successfully!"
      redirect_to photo_path
    else
      render :new
    end
  end

end

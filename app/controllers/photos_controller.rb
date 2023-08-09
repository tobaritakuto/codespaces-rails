class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo, notice: "Photo created successfully"
    else
      render 'new'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end
end

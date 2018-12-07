class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
     @image = Image.new(image_params)
     @image.user_id = current_user.id
     @image.save
    redirect_to user_path(current_user.id)
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to user_path(current_user.id)
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
  end

  def show
    @image = Image.find(params[:id])
  end

  def index
    @images = Images.all
  end
  private
    def image_params
        params.require(:image).permit(:image)
    end
end

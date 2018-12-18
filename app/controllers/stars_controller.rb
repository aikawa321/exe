class StarsController < ApplicationController
   def new
    @star = Star.new
  end

  def create
     @star = Star.new(star_params)
     @star.review_id = Review.find(params[:id])
     @review.save
    redirect_to root_path
  end
end
private
def star_params
 params.require(:star).permit(:review_id, :point)
end

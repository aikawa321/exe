class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
     @review = Review.new(review_params)
     @review.user_id = User.find(params[:id])
     @review.save
    redirect_to root_path
  end
end

private
def review_params
 params.require(:review).permit(:content, :user_id, :name,:star)
end

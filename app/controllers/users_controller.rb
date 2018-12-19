class UsersController < ApplicationController

  def top
    #ViewのFormで取得したパラメータをモデルに渡す
    @users = User.search(params[:search])
    kind_id = params[:id]
    @search_a = User.where(kind_id: 1)
    @search_b = User.where(kind_id: 2)
    @search_c = User.where(kind_id: 3)
    @search_d = User.where(kind_id: 4)
    @search_e = User.where(kind_id: 5)
    @search_f = User.where(kind_id: 6)
    @search_g = User.where(kind_id: 7)
    @search_h = User.where(kind_id: 8)
    @search_i = User.where(kind_id: 9)
    @prefectures = User.area_ids
  end

  def new
    @user.images.build
    @user.reviews.build
  end
  def review_create
    @user = User.find(params[:id])
     @review = Review.new(content: params[:review][:content], user_id: @user.id, name: params[:review][:name], star: params[:review][:star])
     if @review.save
      redirect_to user_path(@user)
     end
  end

  def show
    @user = User.find(params[:id])
    @images = @user.images
     if user_signed_in?
    @room_id = message_room_id(current_user, @user)
    @messages = Message.recent_in_room(@room_id)
     end
     @review = Review.new
     @average = Review.where(user_id: @user.id).average(:star)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
      @user = User.find(current_user.id)
      # @user.id = current_user.id
    @user.update(user_params)
    redirect_to @user
  end

  def area_search
    area_id = params[:id]
    @search_users = User.where(area_id: area_id)
  end

  def message_room_id(first_user, second_user)
    first_id = first_user.id.to_i
    second_id = second_user.id.to_i
    if first_id < second_id
      "#{first_user.id}-#{second_user.id}"
    else
      "#{second_user.id}-#{first_user.id}"
    end
  end

  	private
  	def user_params
      params.require(:user).permit(:name, :introduction, :image,:telephone,:postcode,:address,:email, :kind_id,:area_id, :review_id, images_images: [])
    end
end

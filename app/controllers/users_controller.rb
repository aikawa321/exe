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
    @search_hokkaidou = User.where(area_id: 1)
    @search_aomori = User.where(area_id: 2)
    @search_iwate = User.where(area_id: 3)
    @search_miyagi = User.where(area_id: 4)
    @search_akita = User.where(area_id: 5)
    @search_yamagata = User.where(area_id: 6)
    @search_hukusima = User.where(area_id: 7)
    @search_ibaraki = User.where(area_id: 8)
    @search_totigi = User.where(area_id: 9)
    @search_gunma = User.where(area_id: 10)
    @search_saitama = User.where(area_id: 11)
    @search_tiba = User.where(area_id: 12)
    @search_tokyo = User.where(area_id: 13)
    @search_kanagawa = User.where(area_id: 14)
    @search_niigata = User.where(area_id: 15)
    @search_toyama = User.where(area_id: 16)
    @search_isikawa = User.where(area_id: 17)
    @search_hukui = User.where(area_id: 18)
    @search_yamanashi = User.where(area_id: 19)
    @search_nagano = User.where(area_id: 20)
    @search_gihu = User.where(area_id: 21)
    @search_sizuoka = User.where(area_id: 22)
    @search_aiti = User.where(area_id: 23)
    @search_mie = User.where(area_id: 24)
    @search_shiga = User.where(area_id: 25)
    @search_kyoto = User.where(area_id: 26)
    @search_oosaka = User.where(area_id: 27)
    @search_hyougo = User.where(area_id: 28)
    @search_nara = User.where(area_id: 29)
    @search_wakayama = User.where(area_id: 30)
    @search_tottori = User.where(area_id: 31)
    @search_simane = User.where(area_id: 32)
    @search_okayama = User.where(area_id: 33)
    @search_hiroshima = User.where(area_id: 34)
    @search_yamaguti = User.where(area_id: 35)
    @search_tokushima = User.where(area_id: 36)
    @search_kagawa = User.where(area_id: 37)
    @search_ehime = User.where(area_id: 38)
    @search_kouti = User.where(area_id: 39)
    @search_hukuoka = User.where(area_id: 40)
    @search_saga = User.where(area_id: 41)
    @search_nagasaki = User.where(area_id: 42)
    @search_kumamoto = User.where(area_id: 43)
    @search_ooita = User.where(area_id: 44)
    @search_miyazaki = User.where(area_id: 45)
    @search_kagoshima = User.where(area_id: 46)
    @search_okinawa = User.where(area_id: 47)
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

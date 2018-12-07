class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:destroy,:edit,:update]
  def top
    @users =User.all
  end
  def show
    @user = User.find(params[:id])
    @room_id = message_room_id(current_user, @user)
    @messages = Message.recent_in_room(@room_id)
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
  		params.require(:user).permit(:name, :introduction, :image,:telephone,:postcode,:address,:email)
    end
end

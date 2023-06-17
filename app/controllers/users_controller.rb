class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = current_user
  end
  def profile
  end
  def edit
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to profile_path
  end
  private
    def user_params
      params.require(:user).permit(:user_name, :user_introduction, :price, :address, :room_image, :image , :prof_image)
    end 
end
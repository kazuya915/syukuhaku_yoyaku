class ProfilesController < ApplicationController
  def show
    @user = current_user
  end
  def edit
    @user = current_user
  end
  # def update
  #   @user = User.find(current_user)
  #   @user.update(user_params)
  #   redirect_to profile_path
  # end

  private
  def user_params
    params.require(:user).permit(:user_name, :user_introduction, :price, :address, :room_image, :image )
  end
end

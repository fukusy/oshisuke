class User::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user_image = User.new
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]= "プロフィールを修正しました"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
    
  
end
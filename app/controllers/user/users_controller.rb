class User::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    # @user_events = @user.events
    # @user_relationship_events = @user.joined_events
    relation_array = RelationshipEvent.where(user_id: @user.id).pluck(:event_id)
    user_part_array = Event.where(user_id: @user.id).pluck(:id)
    relation_array.push(user_part_array)
    @user_events = Event.find(relation_array)

    # @user_relationship_events = RelationshipEvent.find(params[:user_id]).where("event_id", event_id)
  end

  def edit
    @user_image = User.new
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
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

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
class FriendsController < ApplicationController
  
  def index
    @friends = current_user.friends
  end

  def destroy
    @user = User.find(params[:user_id])
    @friend = User.find(params[:id])
    @user.friendships.find_by(friend_id: @friend.id).destroy
    flash[:success] = "Unfriended #{@friend.username}"
    redirect_to @friend
  end
  

end

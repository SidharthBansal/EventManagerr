class UsersController < ApplicationController
  
  before_action :logged_in_user
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @events_joined = @user.events.paginate(page: params[:page], per_page: 5)
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
    @friends = @user.friendships
  end
  
  def created_events
    @user = User.find(params[:id])
    @events_created = @user.hosted_events.paginate(page: params[:page], per_page: 5)
  end
  
  private
  
  def logged_in_user
    if !user_signed_in?
      flash[:warning] = "You must be logged in to see your profile."
      redirect_to new_user_session_path
    end
  end 
end

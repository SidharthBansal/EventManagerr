class FriendRequestsController < ApplicationController
    
    before_action :set_friend_request, except: [:index, :create, :update]
    
    def index
        @incoming = FriendRequest.where(friend: current_user)
        @outgoing = current_user.friend_requests
    end
    
    def create
        @friend_request = current_user.friend_requests.build(friend_id: params[:user_id])
        if @friend_request.save
            flash[:success] = 'Friend request sent'
            redirect_to user_path(current_user.id)
        else
            flash[:danger] = "You can't sent a friend request to you'r self!"
            redirect_to user_path(current_user.id)
        end
    end
    
    def update
        @user = User.find(params[:user_id])
        @friend = User.find(params[:id])
        @friendship = @user.friendships.build(friend: @friend)
        if @friendship.save 
            @friend.friend_requests.find_by(friend: @user).destroy
            flash[:success] = "Added #{@friend.username} to friends."
            redirect_to user_path(current_user.id)
        else
            flash[:warning] = "brap"
        end
    end

end

class FriendRequestsController < ApplicationController
    
    before_action :set_friend_request, except: [:index, :create]
    
    def index
        @incoming = FriendRequest.where(friend: current_user)
        @outgoing = current_user.friend_requests
    end
    
    def create
        friend = User.find(params[:user_id])
        @friend_request = current_user.friend_requests(friend_id: friend.id)
        if @friend_request.save
            flash[:success] = 'Friend request sent'
            redirect_to user_path(current_user.id)
        else
            flash[:danger] = "You can't sent a friend request to you'r self!"
            redirect_to user_path(current_user.id)
        end
    end
    
    def update
        @friend_request.accept
        head :no_content
    end
    
    def destroy
        @friend_request.destroy
        head :no_content
    end
    
    
    
    
    
    private
    
        def set_friend_request
            @friend_request = FriendRequest.find(params[:id])
        end
end

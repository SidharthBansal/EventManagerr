class CommentsController < ApplicationController
    
    before_action :logged_in_user

    def create
        @event = Event.find(params[:event_id])
        @comment = @event.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            flash[:success] = "Your comment was submitted successfully"
            redirect_to @event
        else
            flash[:warning] = "Your comment must have a body! "
            redirect_to @event
        end
    end
    
    def destroy
        @event = Event.find(params[:event_id])
        Comment.find(params[:id]).destroy
        flash[:success] = "Comment successfully deleted"
        redirect_to @event
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:body)
    end
    
    def logged_in_user
        if !user_signed_in?
            flash[:warning] = "You must be logged in to see your profile."
            redirect_to new_user_session_path
        end
     end 
end

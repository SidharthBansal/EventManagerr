class CommentsController < ApplicationController
    
    before_action :logged_in_user
    before_action :right_user, only: [:destroy]

    def create
        @event = Event.find(params[:event_id])
        @comment = @event.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            
            respond_to do |format|
                format.html  do
                    flash[:success] = "Comment submitted successfully"
                    redirect_to @event
                end
                format.js { flash.now[:success] = "Comment submitted successfully" }
            end
        else
            flash[:warning] = "Your comment must have a body!"
            redirect_to @event
        end
    end
    
    def destroy
        @event = Event.find(params[:event_id])
        Comment.find(params[:id]).destroy
        flash[:success] = "Comment successfully deleted"
        respond_to do |format|
            format.html do
                flash[:success] = "Comment delted successfully"
                redirect_to @event
            end
            format.js {flash.now[:success] = "Comment deleted successfully"}
        end
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
     
     
    def right_user
        event = Event.find(params[:event_id])
        comment = Comment.find(params[:id])
        if current_user.id != comment.user_id
            flash[:warning] = "You can only delete the comments you created!"
            redirect_to event
        end
    end
end

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @user = users(:batman)
    @other_user = users(:robin)
    @event = events(:party)
    @comment = comments(:comment) # belongs to :batman and party
  end
  
  test "should be logged in to create comment" do
    assert_no_difference "Comment.count" do
      post event_comments_path(@event.id), params: { comment: {
                                                          user_id: @user.id,
                                                          body: "Woah! This comment is awesome!!" } }
    end
    assert_not flash.empty?
    assert_redirected_to new_user_session_path
  end
  
  test "successful create" do
    sign_in @user
    assert_difference "Comment.count", 1 do
      post event_comments_path(@event.id), params: { comment: {
                                                          user_id: @user.id,
                                                          body: "Woah! This comment is awesome!!" } }
    end
    assert_not flash.empty?
    assert_redirected_to @event
  end
  
  test "should be logged in to destroy a comment" do
    assert_no_difference "Comment.count" do
     delete event_comment_path(@event.id, @comment.id)
    end 
    assert_redirected_to new_user_session_path
  end
  
  test "can't delete other users' comments" do
    sign_in @other_user
    assert_no_difference "Comment.count" do
      delete event_comment_path(@event.id, @comment.id)
    end
    assert_not flash.empty?
    assert_redirected_to @event
  end
  
  test "successful destroy"  do
    sign_in @user
    assert_difference "Comment.count", -1 do
      delete event_comment_path(@event.id, @comment.id)
    end
    assert_not flash.empty?
    assert_redirected_to @event
  end
  
end

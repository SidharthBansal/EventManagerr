require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:batman)
    @event = events(:party)
    @comment = @event.comments.build(body: "Yeah", user_id: @user.id)
  end
  
  
  test "should be valid" do
    assert @comment.valid?
  end
  
  test "empty body should not be valid" do
    @comment.body = ""
    assert_not @comment.valid?
  end

  test "should include a user_id" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "should include an event_id" do
    @comment.event_id = nil
    assert_not @comment.valid?
  end

end

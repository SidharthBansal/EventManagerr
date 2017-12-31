require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:batman)
    @comment = @user.comments.build(body: "Yeah")
  end
  
  
  test "should be valid" do
    assert @comment.valid?
  end
  
  test "empty body should not be valid" do
    @comment.body = ""
    assert_not @comment.valid?
  end

end

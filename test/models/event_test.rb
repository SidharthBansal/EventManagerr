require 'test_helper'

class EventTest < ActiveSupport::TestCase


  def setup
    @user = users(:batman)
    @event = @user.events.build(title: "House Warmer", body: "It's going to be great!",
                                location: "My house", date: Time.zone.now)
  end

  test "should be valid" do
    assert @event.valid?
  end

end

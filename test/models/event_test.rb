require 'test_helper'

class EventTest < ActiveSupport::TestCase


  def setup
    @user = users(:batman)
    @event = @user.hosted_events.build(title: "House Warmer",
                                      body: "Hi guys! It my party soon and you're all invited!
                                      I think we're going to have a great time.
                                      Let me know if you're coming",
                                      location: "My house",
                                      date: Time.zone.now)
  end

  test "should be valid" do
    assert @event.valid?
  end

  test "title should be present" do
    @event.title = ""
    assert_not @event.valid?
  end

  test "title should be at least 3 chr long" do
    @event.title = "a" * 2
    assert_not @event.valid?
  end

  test "title should be no more than 150 chr long" do
    @event.title = "w" * 151
    assert_not @event.valid?
  end

  test "body should be present" do
    @event.body = ""
    assert_not @event.valid?
  end

  test "body should be more than 25 chr" do
    @event.body = "a" * 24
    assert_not @event.valid?
  end

  test "body should be no more than 5 chr" do
    @event.body = "a" * 5
    assert_not @event.valid?
  end

  test "location should be present" do
    @event.location = ""
    assert_not @event.valid?
  end

  test "location should be at least 3 chr" do
    @event.location = "a" * 2
    assert_not @event.valid?
  end

  test "location should be no more than 100 chr" do
    @event.location = "a" * 101
    assert_not @event.valid?
  end

  test "date should be present" do
    @event.date = ""
    assert_not @event.valid?
  end

  test "date should be in the future" do
   #.to_datetime
  end

end

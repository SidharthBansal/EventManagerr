require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @event = events(:party)
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get show" do
    get event_path(@event.id)
    assert_response :success
  end

  test "should get new" do
    get new_event_path
    assert_response :success
  end
=begin
  test "should get create" do
    get events_create_url
    assert_response :success
  end
=end
  test "should get edit" do
    get edit_event_path(@event.id)
    assert_response :success
  end
=begin
  test "should get update" do
    get events_update_url
    assert_response :success
  end

  test "should get destroy" do
    get events_destroy_url
    assert_response :success
  end
=end
end

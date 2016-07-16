require 'test_helper'

class CircleEventsControllerTest < ActionController::TestCase
  setup do
    @circle_event = circle_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:circle_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create circle_event" do
    assert_difference('CircleEvent.count') do
      post :create, circle_event: { desc: @circle_event.desc, event_date: @circle_event.event_date, one_phrase: @circle_event.one_phrase, place: @circle_event.place, title: @circle_event.title }
    end

    assert_redirected_to circle_event_path(assigns(:circle_event))
  end

  test "should show circle_event" do
    get :show, id: @circle_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @circle_event
    assert_response :success
  end

  test "should update circle_event" do
    patch :update, id: @circle_event, circle_event: { desc: @circle_event.desc, event_date: @circle_event.event_date, one_phrase: @circle_event.one_phrase, place: @circle_event.place, title: @circle_event.title }
    assert_redirected_to circle_event_path(assigns(:circle_event))
  end

  test "should destroy circle_event" do
    assert_difference('CircleEvent.count', -1) do
      delete :destroy, id: @circle_event
    end

    assert_redirected_to circle_events_path
  end
end

require 'test_helper'

class TimersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timer = timers(:one)
  end

  test "should get index" do
    get timers_url
    assert_response :success
  end

  test "should get new" do
    get new_timer_url
    assert_response :success
  end

  test "should create timer" do
    assert_difference('Timer.count') do
      post timers_url, params: { timer: { token: @timer.token, user_id: @timer.user_id } }
    end

    assert_redirected_to timer_path(Timer.last)
  end

  test "should show timer" do
    get timer_url(@timer)
    assert_response :success
  end

  test "should get edit" do
    get edit_timer_url(@timer)
    assert_response :success
  end

  test "should update timer" do
    patch timer_url(@timer), params: { timer: { token: @timer.token, user_id: @timer.user_id } }
    assert_redirected_to timer_path(@timer)
  end

  test "should destroy timer" do
    assert_difference('Timer.count', -1) do
      delete timer_url(@timer)
    end

    assert_redirected_to timers_path
  end
end

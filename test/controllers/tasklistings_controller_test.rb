require 'test_helper'

class TasklistingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tasklisting = tasklistings(:one)
  end

  test "should get index" do
    get tasklistings_url
    assert_response :success
  end

  test "should get new" do
    get new_tasklisting_url
    assert_response :success
  end

  test "should create tasklisting" do
    assert_difference('Tasklisting.count') do
      post tasklistings_url, params: { tasklisting: { count: @tasklisting.count, name: @tasklisting.name } }
    end

    assert_redirected_to tasklisting_url(Tasklisting.last)
  end

  test "should show tasklisting" do
    get tasklisting_url(@tasklisting)
    assert_response :success
  end

  test "should get edit" do
    get edit_tasklisting_url(@tasklisting)
    assert_response :success
  end

  test "should update tasklisting" do
    patch tasklisting_url(@tasklisting), params: { tasklisting: { count: @tasklisting.count, name: @tasklisting.name } }
    assert_redirected_to tasklisting_url(@tasklisting)
  end

  test "should destroy tasklisting" do
    assert_difference('Tasklisting.count', -1) do
      delete tasklisting_url(@tasklisting)
    end

    assert_redirected_to tasklistings_url
  end
end

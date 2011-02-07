require 'test_helper'

class BubblesControllerTest < ActionController::TestCase
  setup do
    @bubble = bubbles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bubbles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bubble" do
    assert_difference('Bubble.count') do
      post :create, :bubble => @bubble.attributes
    end

    assert_redirected_to bubble_path(assigns(:bubble))
  end

  test "should show bubble" do
    get :show, :id => @bubble.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bubble.to_param
    assert_response :success
  end

  test "should update bubble" do
    put :update, :id => @bubble.to_param, :bubble => @bubble.attributes
    assert_redirected_to bubble_path(assigns(:bubble))
  end

  test "should destroy bubble" do
    assert_difference('Bubble.count', -1) do
      delete :destroy, :id => @bubble.to_param
    end

    assert_redirected_to bubbles_path
  end
end

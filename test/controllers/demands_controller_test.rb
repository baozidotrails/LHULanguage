require 'test_helper'

class DemandsControllerTest < ActionController::TestCase
  setup do
    @demand = demands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:demands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create demand" do
    assert_difference('Demand.count') do
      post :create, demand: { description: @demand.description, user_id: @demand.user_id }
    end

    assert_redirected_to demand_path(assigns(:demand))
  end

  test "should show demand" do
    get :show, id: @demand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @demand
    assert_response :success
  end

  test "should update demand" do
    patch :update, id: @demand, demand: { description: @demand.description, user_id: @demand.user_id }
    assert_redirected_to demand_path(assigns(:demand))
  end

  test "should destroy demand" do
    assert_difference('Demand.count', -1) do
      delete :destroy, id: @demand
    end

    assert_redirected_to demands_path
  end
end

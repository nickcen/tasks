require 'test_helper'

class TaxiTasksControllerTest < ActionController::TestCase
  setup do
    @taxi_task = taxi_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxi_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taxi_task" do
    assert_difference('TaxiTask.count') do
      post :create, taxi_task: {  }
    end

    assert_redirected_to taxi_task_path(assigns(:taxi_task))
  end

  test "should show taxi_task" do
    get :show, id: @taxi_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @taxi_task
    assert_response :success
  end

  test "should update taxi_task" do
    put :update, id: @taxi_task, taxi_task: {  }
    assert_redirected_to taxi_task_path(assigns(:taxi_task))
  end

  test "should destroy taxi_task" do
    assert_difference('TaxiTask.count', -1) do
      delete :destroy, id: @taxi_task
    end

    assert_redirected_to taxi_tasks_path
  end
end

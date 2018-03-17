require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest

  def setup 

    @user = users(:michael)
    @task = tasks(:two)
  end


  test "should get index" do
    get tasks_index_url
    assert_response :success
  end

  test "should get create" do
    get tasks_create_url
    assert_response :success
  end

  test "should get show" do
    get tasks_show_url
    assert_response :success
  end

  test "should get edit" do
    get tasks_edit_url
    assert_response :success
  end

  test "without login,redirect when add tasks" do
    assert_no_difference 'Task.count' do
      post tasks_path, params:{ task: { user_id: @user.id, content: "aaaa" }}
    end
    assert_redirected_to login_url

  end

  test "without login,redirect when delete tasks" do
    assert_no_difference 'Task.count' do
      delete task_path(@task)
    end
    assert_redirected_to login_url
  end

end

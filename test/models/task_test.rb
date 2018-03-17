require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:michael)
  	@task = @user.tasks.build(content:"test")
  end

  test "validation user id test"  do
  	@task.user_id = nil
  	assert_not @task.valid?
  end

  test "validation content" do
  	@task.content = nil
  	assert_not @task.valid?
  end

  test "order scope test" do
  	assert_equal tasks(:most_recent),Task.desc.first
  end


end

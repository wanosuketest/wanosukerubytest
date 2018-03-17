require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:michael)
  end

  test "view profile" do
  	get user_path(@user)
  	assert_template 'users/show'
  	assert_match @user.tasks.count.to_s, response.body
  	assert_select "body span.content"

  end

end


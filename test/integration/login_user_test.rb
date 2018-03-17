require 'test_helper'

class LoginUserTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  		@user = users(:asako)
  end

  test "success login and logout" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, params: { session: { email: @user.email,
  										  password: 'password'
  										}}
  	assert_redirected_to  @user
  	delete logout_path
  	assert_redirected_to root_url
    delete logout_path
  end

  test "missed login" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, params: { session: { email: "pcinko",
  										  password: 'password'
  										}}
  	assert_template 'sessions/new'

  end


  test "login with remembering" do
    log_in_as(@user,remember_me: '1')
    #assert_empty cookies['remember_token']
  end

  test "login without remembering" do
    # クッキーを保存してログイン
    log_in_as(@user, remember_me: '1')
    delete logout_path  
    # クッキーを削除してログイン
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end


end

require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get story" do
    get :story
    assert_response :success
  end

  test "should get invite" do
    get :invite
    assert_response :success
  end

  test "should get wish" do
    get :wish
    assert_response :success
  end

end

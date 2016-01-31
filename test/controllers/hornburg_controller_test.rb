require 'test_helper'

class HornburgControllerTest < ActionController::TestCase
  test "should get approach" do
    get :approach
    assert_response :success
  end

  test "should get knock" do
    get :knock
    assert_response :success
  end

  test "should get leave" do
    get :leave
    assert_response :success
  end

end

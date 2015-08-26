require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get brand" do
    get :brand
    assert_response :success
  end

end

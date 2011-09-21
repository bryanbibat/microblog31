require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  test "should get global" do
    get :global
    assert_response :success
  end

end

require 'test_helper'

class HelplinksControllerTest < ActionController::TestCase
  test "should get _new" do
    get :_new
    assert_response :success
  end

end

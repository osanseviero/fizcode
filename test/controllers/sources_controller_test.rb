require 'test_helper'

class SourcesControllerTest < ActionController::TestCase
  test "should get _new" do
    get :_new
    assert_response :success
  end

end

require 'test_helper'

class SavedsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get saveds_update_url
    assert_response :success
  end

end

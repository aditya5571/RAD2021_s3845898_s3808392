require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get indexPage" do
    get home_indexPage_url
    assert_response :success
  end

end

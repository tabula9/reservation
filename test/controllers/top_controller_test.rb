require "test_helper"

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get top_search_url
    assert_response :success
  end
end

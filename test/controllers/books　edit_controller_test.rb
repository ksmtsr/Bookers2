require "test_helper"

class Books　editControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get books　edit_show_url
    assert_response :success
  end
end

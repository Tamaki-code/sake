require "test_helper"

class SakesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sakes_index_url
    assert_response :success
  end

  test "should get show" do
    get sakes_show_url
    assert_response :success
  end
end

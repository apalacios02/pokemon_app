require "test_helper"

class HeldItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get held_items_index_url
    assert_response :success
  end

  test "should get show" do
    get held_items_show_url
    assert_response :success
  end
end

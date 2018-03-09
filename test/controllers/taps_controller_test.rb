require 'test_helper'

class TapsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get taps_new_url
    assert_response :success
  end

  test "should get create" do
    get taps_create_url
    assert_response :success
  end

  test "should get destroy" do
    get taps_destroy_url
    assert_response :success
  end

  test "should get index" do
    get taps_index_url
    assert_response :success
  end

end

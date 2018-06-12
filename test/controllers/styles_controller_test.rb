require 'test_helper'

class StylesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get styles_new_url
    assert_response :success
  end

  test "should get create" do
    get styles_create_url
    assert_response :success
  end

  test "should get index" do
    get styles_index_url
    assert_response :success
  end

  test "should get destroygit" do
    get styles_destroygit_url
    assert_response :success
  end

  test "should get status" do
    get styles_status_url
    assert_response :success
  end

end

require 'test_helper'

class PubsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pubs_new_url
    assert_response :success
  end

  test "should get create" do
    get pubs_create_url
    assert_response :success
  end

end

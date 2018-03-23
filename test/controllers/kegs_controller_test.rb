require 'test_helper'

class KegsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kegs_index_url
    assert_response :success
  end

end

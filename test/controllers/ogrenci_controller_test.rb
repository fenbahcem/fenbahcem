require 'test_helper'

class OgrenciControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ogrenci_index_url
    assert_response :success
  end

end

require 'test_helper'

class Admin::GeneldosyasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_geneldosya = admin_geneldosyas(:one)
  end

  test "should get index" do
    get admin_geneldosyas_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_geneldosya_url
    assert_response :success
  end

  test "should create admin_geneldosya" do
    assert_difference('Admin::Geneldosya.count') do
      post admin_geneldosyas_url, params: { admin_geneldosya: { baslik: @admin_geneldosya.baslik, sinif: @admin_geneldosya.sinif } }
    end

    assert_redirected_to admin_geneldosya_url(Admin::Geneldosya.last)
  end

  test "should show admin_geneldosya" do
    get admin_geneldosya_url(@admin_geneldosya)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_geneldosya_url(@admin_geneldosya)
    assert_response :success
  end

  test "should update admin_geneldosya" do
    patch admin_geneldosya_url(@admin_geneldosya), params: { admin_geneldosya: { baslik: @admin_geneldosya.baslik, sinif: @admin_geneldosya.sinif } }
    assert_redirected_to admin_geneldosya_url(@admin_geneldosya)
  end

  test "should destroy admin_geneldosya" do
    assert_difference('Admin::Geneldosya.count', -1) do
      delete admin_geneldosya_url(@admin_geneldosya)
    end

    assert_redirected_to admin_geneldosyas_url
  end
end

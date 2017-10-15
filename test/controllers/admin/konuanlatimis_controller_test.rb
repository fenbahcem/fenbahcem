require 'test_helper'

class Admin::KonuanlatimisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_konuanlatimi = admin_konuanlatimis(:one)
  end

  test "should get index" do
    get admin_konuanlatimis_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_konuanlatimi_url
    assert_response :success
  end

  test "should create admin_konuanlatimi" do
    assert_difference('Admin::Konuanlatimi.count') do
      post admin_konuanlatimis_url, params: { admin_konuanlatimi: { kavram: @admin_konuanlatimi.kavram, metin: @admin_konuanlatimi.metin, sinif: @admin_konuanlatimi.sinif, uniteadi: @admin_konuanlatimi.uniteadi } }
    end

    assert_redirected_to admin_konuanlatimi_url(Admin::Konuanlatimi.last)
  end

  test "should show admin_konuanlatimi" do
    get admin_konuanlatimi_url(@admin_konuanlatimi)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_konuanlatimi_url(@admin_konuanlatimi)
    assert_response :success
  end

  test "should update admin_konuanlatimi" do
    patch admin_konuanlatimi_url(@admin_konuanlatimi), params: { admin_konuanlatimi: { kavram: @admin_konuanlatimi.kavram, metin: @admin_konuanlatimi.metin, sinif: @admin_konuanlatimi.sinif, uniteadi: @admin_konuanlatimi.uniteadi } }
    assert_redirected_to admin_konuanlatimi_url(@admin_konuanlatimi)
  end

  test "should destroy admin_konuanlatimi" do
    assert_difference('Admin::Konuanlatimi.count', -1) do
      delete admin_konuanlatimi_url(@admin_konuanlatimi)
    end

    assert_redirected_to admin_konuanlatimis_url
  end
end

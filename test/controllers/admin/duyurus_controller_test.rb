require 'test_helper'

class Admin::DuyurusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_duyuru = admin_duyurus(:one)
  end

  test "should get index" do
    get admin_duyurus_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_duyuru_url
    assert_response :success
  end

  test "should create admin_duyuru" do
    assert_difference('Admin::Duyuru.count') do
      post admin_duyurus_url, params: { admin_duyuru: { aciklama: @admin_duyuru.aciklama, tur: @admin_duyuru.tur } }
    end

    assert_redirected_to admin_duyuru_url(Admin::Duyuru.last)
  end

  test "should show admin_duyuru" do
    get admin_duyuru_url(@admin_duyuru)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_duyuru_url(@admin_duyuru)
    assert_response :success
  end

  test "should update admin_duyuru" do
    patch admin_duyuru_url(@admin_duyuru), params: { admin_duyuru: { aciklama: @admin_duyuru.aciklama, tur: @admin_duyuru.tur } }
    assert_redirected_to admin_duyuru_url(@admin_duyuru)
  end

  test "should destroy admin_duyuru" do
    assert_difference('Admin::Duyuru.count', -1) do
      delete admin_duyuru_url(@admin_duyuru)
    end

    assert_redirected_to admin_duyurus_url
  end
end

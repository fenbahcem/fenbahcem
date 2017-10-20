require 'test_helper'

class Admin::DenemesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_deneme = admin_denemes(:one)
  end

  test "should get index" do
    get admin_denemes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_deneme_url
    assert_response :success
  end

  test "should create admin_deneme" do
    assert_difference('Admin::Deneme.count') do
      post admin_denemes_url, params: { admin_deneme: { aciklama: @admin_deneme.aciklama, denemeadi: @admin_deneme.denemeadi, sinif: @admin_deneme.sinif, uniteadi: @admin_deneme.uniteadi } }
    end

    assert_redirected_to admin_deneme_url(Admin::Deneme.last)
  end

  test "should show admin_deneme" do
    get admin_deneme_url(@admin_deneme)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_deneme_url(@admin_deneme)
    assert_response :success
  end

  test "should update admin_deneme" do
    patch admin_deneme_url(@admin_deneme), params: { admin_deneme: { aciklama: @admin_deneme.aciklama, denemeadi: @admin_deneme.denemeadi, sinif: @admin_deneme.sinif, uniteadi: @admin_deneme.uniteadi } }
    assert_redirected_to admin_deneme_url(@admin_deneme)
  end

  test "should destroy admin_deneme" do
    assert_difference('Admin::Deneme.count', -1) do
      delete admin_deneme_url(@admin_deneme)
    end

    assert_redirected_to admin_denemes_url
  end
end

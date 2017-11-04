require 'test_helper'

class Admin::FotogalerisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_fotogaleri = admin_fotogaleris(:one)
  end

  test "should get index" do
    get admin_fotogaleris_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_fotogaleri_url
    assert_response :success
  end

  test "should create admin_fotogaleri" do
    assert_difference('Admin::Fotogaleri.count') do
      post admin_fotogaleris_url, params: { admin_fotogaleri: { aciklama: @admin_fotogaleri.aciklama, baslik: @admin_fotogaleri.baslik } }
    end

    assert_redirected_to admin_fotogaleri_url(Admin::Fotogaleri.last)
  end

  test "should show admin_fotogaleri" do
    get admin_fotogaleri_url(@admin_fotogaleri)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_fotogaleri_url(@admin_fotogaleri)
    assert_response :success
  end

  test "should update admin_fotogaleri" do
    patch admin_fotogaleri_url(@admin_fotogaleri), params: { admin_fotogaleri: { aciklama: @admin_fotogaleri.aciklama, baslik: @admin_fotogaleri.baslik } }
    assert_redirected_to admin_fotogaleri_url(@admin_fotogaleri)
  end

  test "should destroy admin_fotogaleri" do
    assert_difference('Admin::Fotogaleri.count', -1) do
      delete admin_fotogaleri_url(@admin_fotogaleri)
    end

    assert_redirected_to admin_fotogaleris_url
  end
end

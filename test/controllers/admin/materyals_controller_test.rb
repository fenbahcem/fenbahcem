require 'test_helper'

class Admin::MateryalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_materyal = admin_materyals(:one)
  end

  test "should get index" do
    get admin_materyals_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_materyal_url
    assert_response :success
  end

  test "should create admin_materyal" do
    assert_difference('Admin::Materyal.count') do
      post admin_materyals_url, params: { admin_materyal: { materyalaciklama: @admin_materyal.materyalaciklama, materyaladi: @admin_materyal.materyaladi, materyaltur: @admin_materyal.materyaltur, sinif: @admin_materyal.sinif, uniteadi: @admin_materyal.uniteadi } }
    end

    assert_redirected_to admin_materyal_url(Admin::Materyal.last)
  end

  test "should show admin_materyal" do
    get admin_materyal_url(@admin_materyal)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_materyal_url(@admin_materyal)
    assert_response :success
  end

  test "should update admin_materyal" do
    patch admin_materyal_url(@admin_materyal), params: { admin_materyal: { materyalaciklama: @admin_materyal.materyalaciklama, materyaladi: @admin_materyal.materyaladi, materyaltur: @admin_materyal.materyaltur, sinif: @admin_materyal.sinif, uniteadi: @admin_materyal.uniteadi } }
    assert_redirected_to admin_materyal_url(@admin_materyal)
  end

  test "should destroy admin_materyal" do
    assert_difference('Admin::Materyal.count', -1) do
      delete admin_materyal_url(@admin_materyal)
    end

    assert_redirected_to admin_materyals_url
  end
end

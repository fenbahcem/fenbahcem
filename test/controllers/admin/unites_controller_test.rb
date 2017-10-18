require 'test_helper'

class Admin::UnitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_unite = admin_unites(:one)
  end

  test "should get index" do
    get admin_unites_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_unite_url
    assert_response :success
  end

  test "should create admin_unite" do
    assert_difference('Admin::Unite.count') do
      post admin_unites_url, params: { admin_unite: { aciklama: @admin_unite.aciklama, uniteadi: @admin_unite.uniteadi } }
    end

    assert_redirected_to admin_unite_url(Admin::Unite.last)
  end

  test "should show admin_unite" do
    get admin_unite_url(@admin_unite)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_unite_url(@admin_unite)
    assert_response :success
  end

  test "should update admin_unite" do
    patch admin_unite_url(@admin_unite), params: { admin_unite: { aciklama: @admin_unite.aciklama, uniteadi: @admin_unite.uniteadi } }
    assert_redirected_to admin_unite_url(@admin_unite)
  end

  test "should destroy admin_unite" do
    assert_difference('Admin::Unite.count', -1) do
      delete admin_unite_url(@admin_unite)
    end

    assert_redirected_to admin_unites_url
  end
end

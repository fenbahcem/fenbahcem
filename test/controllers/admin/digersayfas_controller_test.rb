require 'test_helper'

class Admin::DigersayfasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_digersayfa = admin_digersayfas(:one)
  end

  test "should get index" do
    get admin_digersayfas_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_digersayfa_url
    assert_response :success
  end

  test "should create admin_digersayfa" do
    assert_difference('Admin::Digersayfa.count') do
      post admin_digersayfas_url, params: { admin_digersayfa: { baslik: @admin_digersayfa.baslik, metin: @admin_digersayfa.metin } }
    end

    assert_redirected_to admin_digersayfa_url(Admin::Digersayfa.last)
  end

  test "should show admin_digersayfa" do
    get admin_digersayfa_url(@admin_digersayfa)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_digersayfa_url(@admin_digersayfa)
    assert_response :success
  end

  test "should update admin_digersayfa" do
    patch admin_digersayfa_url(@admin_digersayfa), params: { admin_digersayfa: { baslik: @admin_digersayfa.baslik, metin: @admin_digersayfa.metin } }
    assert_redirected_to admin_digersayfa_url(@admin_digersayfa)
  end

  test "should destroy admin_digersayfa" do
    assert_difference('Admin::Digersayfa.count', -1) do
      delete admin_digersayfa_url(@admin_digersayfa)
    end

    assert_redirected_to admin_digersayfas_url
  end
end

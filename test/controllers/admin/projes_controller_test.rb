require 'test_helper'

class Admin::ProjesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_proje = admin_projes(:one)
  end

  test "should get index" do
    get admin_projes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_proje_url
    assert_response :success
  end

  test "should create admin_proje" do
    assert_difference('Admin::Proje.count') do
      post admin_projes_url, params: { admin_proje: { kavram: @admin_proje.kavram, kisi: @admin_proje.kisi, nasil: @admin_proje.nasil, projeaciklama: @admin_proje.projeaciklama, projeadi: @admin_proje.projeadi, sonuc: @admin_proje.sonuc } }
    end

    assert_redirected_to admin_proje_url(Admin::Proje.last)
  end

  test "should show admin_proje" do
    get admin_proje_url(@admin_proje)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_proje_url(@admin_proje)
    assert_response :success
  end

  test "should update admin_proje" do
    patch admin_proje_url(@admin_proje), params: { admin_proje: { kavram: @admin_proje.kavram, kisi: @admin_proje.kisi, nasil: @admin_proje.nasil, projeaciklama: @admin_proje.projeaciklama, projeadi: @admin_proje.projeadi, sonuc: @admin_proje.sonuc } }
    assert_redirected_to admin_proje_url(@admin_proje)
  end

  test "should destroy admin_proje" do
    assert_difference('Admin::Proje.count', -1) do
      delete admin_proje_url(@admin_proje)
    end

    assert_redirected_to admin_projes_url
  end
end

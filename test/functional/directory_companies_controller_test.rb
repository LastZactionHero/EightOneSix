require 'test_helper'

class DirectoryCompaniesControllerTest < ActionController::TestCase
  setup do
    @directory_company = directory_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:directory_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create directory_company" do
    assert_difference('DirectoryCompany.count') do
      post :create, :directory_company => @directory_company.attributes
    end

    assert_redirected_to directory_company_path(assigns(:directory_company))
  end

  test "should show directory_company" do
    get :show, :id => @directory_company.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @directory_company.to_param
    assert_response :success
  end

  test "should update directory_company" do
    put :update, :id => @directory_company.to_param, :directory_company => @directory_company.attributes
    assert_redirected_to directory_company_path(assigns(:directory_company))
  end

  test "should destroy directory_company" do
    assert_difference('DirectoryCompany.count', -1) do
      delete :destroy, :id => @directory_company.to_param
    end

    assert_redirected_to directory_companies_path
  end
end

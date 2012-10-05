require 'test_helper'

class HoresasesControllerTest < ActionController::TestCase
  setup do
    @horesase = horesases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:horesases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create horesase" do
    assert_difference('Horesase.count') do
      post :create, horesase: { body: @horesase.body, id: @horesase.id }
    end

    assert_redirected_to horesase_path(assigns(:horesase))
  end

  test "should show horesase" do
    get :show, id: @horesase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @horesase
    assert_response :success
  end

  test "should update horesase" do
    put :update, id: @horesase, horesase: { body: @horesase.body, id: @horesase.id }
    assert_redirected_to horesase_path(assigns(:horesase))
  end

  test "should destroy horesase" do
    assert_difference('Horesase.count', -1) do
      delete :destroy, id: @horesase
    end

    assert_redirected_to horesases_path
  end
end

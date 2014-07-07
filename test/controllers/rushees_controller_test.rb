require 'test_helper'

class RusheesControllerTest < ActionController::TestCase
  setup do
    @rushee = rushees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rushees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rushee" do
    assert_difference('Rushee.count') do
      post :create, rushee: { age: @rushee.age, bio: @rushee.bio, name: @rushee.name }
    end

    assert_redirected_to rushee_path(assigns(:rushee))
  end

  test "should show rushee" do
    get :show, id: @rushee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rushee
    assert_response :success
  end

  test "should update rushee" do
    patch :update, id: @rushee, rushee: { age: @rushee.age, bio: @rushee.bio, name: @rushee.name }
    assert_redirected_to rushee_path(assigns(:rushee))
  end

  test "should destroy rushee" do
    assert_difference('Rushee.count', -1) do
      delete :destroy, id: @rushee
    end

    assert_redirected_to rushees_path
  end
end

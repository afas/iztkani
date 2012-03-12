require 'test_helper'

class PaperImagesControllerTest < ActionController::TestCase
  setup do
    @paper_image = paper_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paper_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paper_image" do
    assert_difference('PaperImage.count') do
      post :create, :paper_image => @paper_image.attributes
    end

    assert_redirected_to paper_image_path(assigns(:paper_image))
  end

  test "should show paper_image" do
    get :show, :id => @paper_image.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @paper_image.to_param
    assert_response :success
  end

  test "should update paper_image" do
    put :update, :id => @paper_image.to_param, :paper_image => @paper_image.attributes
    assert_redirected_to paper_image_path(assigns(:paper_image))
  end

  test "should destroy paper_image" do
    assert_difference('PaperImage.count', -1) do
      delete :destroy, :id => @paper_image.to_param
    end

    assert_redirected_to paper_images_path
  end
end

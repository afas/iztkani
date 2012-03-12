require 'test_helper'

class SpecialOffersControllerTest < ActionController::TestCase
  setup do
    @special_offer = special_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:special_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create special_offer" do
    assert_difference('SpecialOffer.count') do
      post :create, :special_offer => @special_offer.attributes
    end

    assert_redirected_to special_offer_path(assigns(:special_offer))
  end

  test "should show special_offer" do
    get :show, :id => @special_offer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @special_offer.to_param
    assert_response :success
  end

  test "should update special_offer" do
    put :update, :id => @special_offer.to_param, :special_offer => @special_offer.attributes
    assert_redirected_to special_offer_path(assigns(:special_offer))
  end

  test "should destroy special_offer" do
    assert_difference('SpecialOffer.count', -1) do
      delete :destroy, :id => @special_offer.to_param
    end

    assert_redirected_to special_offers_path
  end
end

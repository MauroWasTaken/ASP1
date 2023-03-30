require "test_helper"

class PersonPromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_promotion = person_promotions(:one)
  end

  test "should get index" do
    get person_promotions_url
    assert_response :success
  end

  test "should get new" do
    get new_person_promotion_url
    assert_response :success
  end

  test "should create person_promotion" do
    assert_difference("PersonPromotion.count") do
      post person_promotions_url, params: { person_promotion: { person_id: @person_promotion.person_id, promotion_id: @person_promotion.promotion_id } }
    end

    assert_redirected_to person_promotion_url(PersonPromotion.last)
  end

  test "should show person_promotion" do
    get person_promotion_url(@person_promotion)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_promotion_url(@person_promotion)
    assert_response :success
  end

  test "should update person_promotion" do
    patch person_promotion_url(@person_promotion), params: { person_promotion: { person_id: @person_promotion.person_id, promotion_id: @person_promotion.promotion_id } }
    assert_redirected_to person_promotion_url(@person_promotion)
  end

  test "should destroy person_promotion" do
    assert_difference("PersonPromotion.count", -1) do
      delete person_promotion_url(@person_promotion)
    end

    assert_redirected_to person_promotions_url
  end
end

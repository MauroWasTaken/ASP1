require "test_helper"

class LecturePromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lecture_promotion = lecture_promotions(:one)
  end

  test "should get index" do
    get lecture_promotions_url
    assert_response :success
  end

  test "should get new" do
    get new_lecture_promotion_url
    assert_response :success
  end

  test "should create lecture_promotion" do
    assert_difference("LecturePromotion.count") do
      post lecture_promotions_url, params: { lecture_promotion: { lecture_id: @lecture_promotion.lecture_id, person_id: @lecture_promotion.person_id, promotion_id: @lecture_promotion.promotion_id, semester_id: @lecture_promotion.semester_id } }
    end

    assert_redirected_to lecture_promotion_url(LecturePromotion.last)
  end

  test "should show lecture_promotion" do
    get lecture_promotion_url(@lecture_promotion)
    assert_response :success
  end

  test "should get edit" do
    get edit_lecture_promotion_url(@lecture_promotion)
    assert_response :success
  end

  test "should update lecture_promotion" do
    patch lecture_promotion_url(@lecture_promotion), params: { lecture_promotion: { lecture_id: @lecture_promotion.lecture_id, person_id: @lecture_promotion.person_id, promotion_id: @lecture_promotion.promotion_id, semester_id: @lecture_promotion.semester_id } }
    assert_redirected_to lecture_promotion_url(@lecture_promotion)
  end

  test "should destroy lecture_promotion" do
    assert_difference("LecturePromotion.count", -1) do
      delete lecture_promotion_url(@lecture_promotion)
    end

    assert_redirected_to lecture_promotions_url
  end
end

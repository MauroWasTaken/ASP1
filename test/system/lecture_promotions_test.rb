require "application_system_test_case"

class LecturePromotionsTest < ApplicationSystemTestCase
  setup do
    @lecture_promotion = lecture_promotions(:one)
  end

  test "visiting the index" do
    visit lecture_promotions_url
    assert_selector "h1", text: "Lecture promotions"
  end

  test "should create lecture promotion" do
    visit lecture_promotions_url
    click_on "New lecture promotion"

    fill_in "Lecture", with: @lecture_promotion.lecture_id
    fill_in "Person", with: @lecture_promotion.person_id
    fill_in "Promotion", with: @lecture_promotion.promotion_id
    fill_in "Semester", with: @lecture_promotion.semester_id
    click_on "Create Lecture promotion"

    assert_text "Lecture promotion was successfully created"
    click_on "Back"
  end

  test "should update Lecture promotion" do
    visit lecture_promotion_url(@lecture_promotion)
    click_on "Edit this lecture promotion", match: :first

    fill_in "Lecture", with: @lecture_promotion.lecture_id
    fill_in "Person", with: @lecture_promotion.person_id
    fill_in "Promotion", with: @lecture_promotion.promotion_id
    fill_in "Semester", with: @lecture_promotion.semester_id
    click_on "Update Lecture promotion"

    assert_text "Lecture promotion was successfully updated"
    click_on "Back"
  end

  test "should destroy Lecture promotion" do
    visit lecture_promotion_url(@lecture_promotion)
    click_on "Destroy this lecture promotion", match: :first

    assert_text "Lecture promotion was successfully destroyed"
  end
end

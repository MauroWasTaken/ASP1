require "application_system_test_case"

class PersonPromotionsTest < ApplicationSystemTestCase
  setup do
    @person_promotion = person_promotions(:one)
  end

  test "visiting the index" do
    visit person_promotions_url
    assert_selector "h1", text: "Person promotions"
  end

  test "should create person promotion" do
    visit person_promotions_url
    click_on "New person promotion"

    fill_in "Person", with: @person_promotion.person_id
    fill_in "Promotion", with: @person_promotion.promotion_id
    click_on "Create Person promotion"

    assert_text "Person promotion was successfully created"
    click_on "Back"
  end

  test "should update Person promotion" do
    visit person_promotion_url(@person_promotion)
    click_on "Edit this person promotion", match: :first

    fill_in "Person", with: @person_promotion.person_id
    fill_in "Promotion", with: @person_promotion.promotion_id
    click_on "Update Person promotion"

    assert_text "Person promotion was successfully updated"
    click_on "Back"
  end

  test "should destroy Person promotion" do
    visit person_promotion_url(@person_promotion)
    click_on "Destroy this person promotion", match: :first

    assert_text "Person promotion was successfully destroyed"
  end
end

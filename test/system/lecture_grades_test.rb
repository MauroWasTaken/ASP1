require "application_system_test_case"

class LectureGradesTest < ApplicationSystemTestCase
  setup do
    @lecture_grade = lecture_grades(:one)
  end

  test "visiting the index" do
    visit lecture_grades_url
    assert_selector "h1", text: "Lecture grades"
  end

  test "should create lecture grade" do
    visit lecture_grades_url
    click_on "New lecture grade"

    fill_in "Grade", with: @lecture_grade.grade_id
    fill_in "Lecture", with: @lecture_grade.lecture_id
    click_on "Create Lecture grade"

    assert_text "Lecture grade was successfully created"
    click_on "Back"
  end

  test "should update Lecture grade" do
    visit lecture_grade_url(@lecture_grade)
    click_on "Edit this lecture grade", match: :first

    fill_in "Grade", with: @lecture_grade.grade_id
    fill_in "Lecture", with: @lecture_grade.lecture_id
    click_on "Update Lecture grade"

    assert_text "Lecture grade was successfully updated"
    click_on "Back"
  end

  test "should destroy Lecture grade" do
    visit lecture_grade_url(@lecture_grade)
    click_on "Destroy this lecture grade", match: :first

    assert_text "Lecture grade was successfully destroyed"
  end
end

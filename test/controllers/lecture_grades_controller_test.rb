require "test_helper"

class LectureGradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lecture_grade = lecture_grades(:one)
  end

  test "should get index" do
    get lecture_grades_url
    assert_response :success
  end

  test "should get new" do
    get new_lecture_grade_url
    assert_response :success
  end

  test "should create lecture_grade" do
    assert_difference("LectureGrade.count") do
      post lecture_grades_url, params: { lecture_grade: { grade_id: @lecture_grade.grade_id, lecture_id: @lecture_grade.lecture_id } }
    end

    assert_redirected_to lecture_grade_url(LectureGrade.last)
  end

  test "should show lecture_grade" do
    get lecture_grade_url(@lecture_grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_lecture_grade_url(@lecture_grade)
    assert_response :success
  end

  test "should update lecture_grade" do
    patch lecture_grade_url(@lecture_grade), params: { lecture_grade: { grade_id: @lecture_grade.grade_id, lecture_id: @lecture_grade.lecture_id } }
    assert_redirected_to lecture_grade_url(@lecture_grade)
  end

  test "should destroy lecture_grade" do
    assert_difference("LectureGrade.count", -1) do
      delete lecture_grade_url(@lecture_grade)
    end

    assert_redirected_to lecture_grades_url
  end
end

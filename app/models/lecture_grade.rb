class LectureGrade < ApplicationRecord
  belongs_to :lecture
  belongs_to :grade

  validates :lecture_id, presence: true
  validates :grade_id, presence: true
end

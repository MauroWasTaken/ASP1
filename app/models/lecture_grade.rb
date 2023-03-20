class LectureGrade < ApplicationRecord
  belongs_to :lecture
  belongs_to :grade
end

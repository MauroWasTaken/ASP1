class LecturePromotion < ApplicationRecord
  belongs_to :lecture
  belongs_to :promotion
  belongs_to :semester
  belongs_to :person, class_name: 'Person'

  validates :lecture_id, presence: true
  validates :promotion_id, presence: true
  validates :semester_id, presence: true
  validates :person_id, presence: true
end

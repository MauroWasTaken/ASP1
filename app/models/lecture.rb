class Lecture < ApplicationRecord
  belongs_to :category
  has_many :lecture_promotions
  has_many :promotions, through: :lecture_promotions
  has_many :lecture_grades
  has_many :grades, through: :lecture_grades

  validates :name, presence: true
  validates :description, presence: true
end

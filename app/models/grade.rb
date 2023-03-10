class Grade < ApplicationRecord
  belongs_to :semester
  belongs_to :promotion
  belongs_to :student, class_name: 'Person'
  belongs_to :teacher, class_name: 'Person'
  has_many :lecture_grades
  has_many :lectures, through: :lecture_grades

  validates :name, presence: true
  validates :result, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 6 }
  validates :weight, presence: true
  validates :date, presence: true
end

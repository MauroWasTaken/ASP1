class Person < ApplicationRecord
  has_many :person_promotions
  has_many :promotions, through: :person_promotions
  has_many :student_grades, class_name: "Grade", foreign_key: "student_id"
  has_many :teacher_grades, class_name: "Grade", foreign_key: "teacher_id"

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :type_person_id, presence: true
end

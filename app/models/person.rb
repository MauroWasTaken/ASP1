class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :person_promotions
  has_many :promotions, through: :person_promotions
  has_many :student_grades, class_name: "Grade", foreign_key: "student_id"
  has_many :teacher_grades, class_name: "Grade", foreign_key: "teacher_id"
  has_many :teacher_promotions, class_name: "Promotion", foreign_key: "teacher_id"
  has_many :lectures, through: :teacher_promotions
  belongs_to :type_person

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :type_person_id, presence: true

  def fullname
    "#{firstname} #{lastname}"
  end

  def teacher?
    check_role("Teacher")
  end
  
  def student?
    check_role("Student")
  end

  def check_role(role)
    type_person.name == role
  end
end


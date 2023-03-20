require 'faker'

# Create categories
5.times do
  Category.create!(name: Faker::Book.genre)
end

# Create lectures
10.times do
  Lecture.create!(
    name: Faker::Educator.course_name,
    description: Faker::Lorem.paragraph(sentence_count: 3),
    category_id: Category.all.sample.id
  )
end

# Create Type of person
TypePerson.create!(name: 'Student', description: 'Student of the school', slug: 'STU')
TypePerson.create!(name: 'Teacher', description: 'Teacher of the school', slug: 'TEA')

# Create students
50.times do
  Person.create!(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    type_person_id: TypePerson.find_by(slug: 'STU').id
  )
end

# Create teachers
10.times do
  Person.create!(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    type_person_id: TypePerson.find_by(slug: 'TEA').id
  )
end

# Create promotions
20.times do |i|
  Promotion.create!(
    name: "Promotion CPNV #{10.years.ago + i}",
    start_date: Faker::Date.in_date_period(year: 2013 + i, month: 8),
    end_date: Faker::Date.in_date_period(year: 2015 + i, month: 6),
    teacher_id: Person.where(type_person_id: TypePerson.find_by(slug: 'TEA').id).sample.id
  )
end

# Create semesters
4.times do |i|
  Semester.create(name: "Semestre #{i + 1}"
  )
end

# Create LecturePromotions
Lecture.all.each do |lecture|
  LecturePromotion.create!(
    lecture_id: lecture.id,
    promotion_id: Promotion.all.sample.id,
    semester_id: Semester.all.sample.id,
    person_id: Person.all.sample.id
  )
end

# Create PersonPromotions
Person.where(type_person_id: TypePerson.find_by(slug: 'STU').id).each do |student|
  PersonPromotion.create!(
    person_id: student.id,
    promotion_id: Promotion.all.sample.id
  )
end

# Create Grade
student = TypePerson.find_by(slug: 'STU') # replace with your slug for type_person = 2
person_ids = student.people.pluck(:id)
promotion_ids = Promotion.pluck(:id)
person_ids.each do |person_id|
  promotion_id = promotion_ids.sample
  Grade.create(
    name: Faker::Educator.course_name,
    result: Faker::Number.between(from: 1.0, to: 6.0),
    weight: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    date: Faker::Date.backward(days: 30),
    student_id: person_id,
    teacher_id: Promotion.find(promotion_id).teacher_id,
    promotion_id: promotion_id,
    semester_id: Semester.all.sample.id,
  )
end

# Create Lecture Grade
lecture_ids = Lecture.pluck(:id)
grade_ids = Grade.pluck(:id)
lecture_ids.each do |lecture_id|
  grade_id = grade_ids.sample
  LectureGrade.create(grade_id: grade_id, lecture_id: lecture_id)
end
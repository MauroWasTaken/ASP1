# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_23_234631) do
  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string "name"
    t.decimal "result", precision: 1, scale: 1, null: false
    t.decimal "weight", precision: 3, scale: 2, null: false
    t.date "date", null: false
    t.integer "semester_id", null: false
    t.integer "promotion_id", null: false
    t.integer "student_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_grades_on_promotion_id"
    t.index ["semester_id"], name: "index_grades_on_semester_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
    t.index ["teacher_id"], name: "index_grades_on_teacher_id"
  end

  create_table "lecture_grades", force: :cascade do |t|
    t.integer "lecture_id", null: false
    t.integer "grade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_id"], name: "index_lecture_grades_on_grade_id"
    t.index ["lecture_id"], name: "index_lecture_grades_on_lecture_id"
  end

  create_table "lecture_promotions", force: :cascade do |t|
    t.integer "lecture_id", null: false
    t.integer "promotion_id", null: false
    t.integer "semester_id", null: false
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_lecture_promotions_on_lecture_id"
    t.index ["person_id"], name: "index_lecture_promotions_on_person_id"
    t.index ["promotion_id"], name: "index_lecture_promotions_on_promotion_id"
    t.index ["semester_id"], name: "index_lecture_promotions_on_semester_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_lectures_on_category_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.integer "type_person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_person_id"], name: "index_people_on_type_person_id"
  end

  create_table "person_promotions", force: :cascade do |t|
    t.integer "promotion_id", null: false
    t.integer "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_person_promotions_on_person_id"
    t.index ["promotion_id"], name: "index_person_promotions_on_promotion_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_people", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "grades", "people", column: "student_id"
  add_foreign_key "grades", "people", column: "teacher_id"
  add_foreign_key "grades", "promotions"
  add_foreign_key "grades", "semesters"
  add_foreign_key "lecture_grades", "grades"
  add_foreign_key "lecture_grades", "lectures"
  add_foreign_key "lecture_promotions", "lectures"
  add_foreign_key "lecture_promotions", "people"
  add_foreign_key "lecture_promotions", "promotions"
  add_foreign_key "lecture_promotions", "semesters"
  add_foreign_key "lectures", "categories"
  add_foreign_key "people", "type_people"
  add_foreign_key "person_promotions", "people"
  add_foreign_key "person_promotions", "promotions"
end

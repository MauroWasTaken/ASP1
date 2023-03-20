class CreateLectureGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :lecture_grades do |t|
      t.references :lecture, null: false, foreign_key: true
      t.references :grade, null: false, foreign_key: true
      t.timestamps
    end
  end
end

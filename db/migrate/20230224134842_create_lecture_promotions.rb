class CreateLecturePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :lecture_promotions do |t|
      t.references :lecture, null: false, foreign_key: true
      t.references :promotion, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.timestamps
    end
  end
end


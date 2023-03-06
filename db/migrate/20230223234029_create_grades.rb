class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :name
      t.decimal :result, precision: 1, scale: 1, null: false
      t.decimal :weight, precision: 3, scale: 2, null: false
      t.date :date, null: false
      t.references :semester, null: false, foreign_key: true
      t.references :promotion, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: { to_table: :people }
      t.references :teacher, null: false, foreign_key: { to_table: :people }
      t.timestamps
    end
  end
end

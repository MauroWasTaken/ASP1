class CreateLectures < ActiveRecord::Migration[7.0]
  def change
    create_table :lectures do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :teacher, null: false, foreign_key: { to_table: :people }
      t.timestamps
    end
  end
end

class CreatePersonPromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :person_promotions do |t|
      t.references :promotion, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.timestamps
    end
  end
end

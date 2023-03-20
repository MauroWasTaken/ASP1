class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :email, null: false
      t.string :phone
      t.references :type_person, null: false, foreign_key: true
      t.timestamps
    end
  end
end

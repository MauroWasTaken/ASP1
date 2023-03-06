class CreateTypePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :type_people do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description
      t.timestamps
    end
  end
end

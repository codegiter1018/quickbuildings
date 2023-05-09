class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|

      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.string :prefecture, null: false
      t.string :buildings_name, null: false
      t.string :address, null: false
      t.date :completion, null: false
      t.date :renewal
      t.text :description


    end
  end
end

class CreateNutritionInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :nutrition_informations do |t|
      t.references :product, index: true
      t.integer :serving_value
      t.integer :serving_units, default: 0, null: false
      t.timestamps
    end
  end
end

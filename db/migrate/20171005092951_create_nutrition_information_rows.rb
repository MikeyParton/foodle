class CreateNutritionInformationRows < ActiveRecord::Migration[5.1]
  def change
    create_table :nutrition_information_rows do |t|
      t.references :nutrition_information, index: true
      t.integer :nutrient, default: 0, null: false
      t.decimal :value, precision: 5, scale: 2
      t.integer :units, default: 0, null: false
      t.timestamps
    end
  end
end

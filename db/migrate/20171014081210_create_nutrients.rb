class CreateNutrients < ActiveRecord::Migration[5.1]
  def change
    create_table :nutrients do |t|
      t.integer :energy_base_value
      t.string :energy_base_unit
      t.integer :proteins_base_value
      t.string :proteins_base_unit
      t.integer :carbohydrates_base_value
      t.string :carbohydrates_base_unit
      t.integer :fat_base_value
      t.string :fat_base_unit
      t.integer :sugars_base_value
      t.string :sugars_base_unit
      t.integer :fiber_base_value
      t.string :fiber_base_unit
      t.integer :sodium_base_value
      t.string :sodium_base_unit
      t.references :product, index: true
      t.timestamps
    end
  end
end

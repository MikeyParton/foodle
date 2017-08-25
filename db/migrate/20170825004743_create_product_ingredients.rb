class CreateProductIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :product_ingredients do |t|
      t.references :product, index: true
      t.references :ingredient, index: true
      t.decimal :quantity, precision: 8, scale: 2
      t.integer :units
      t.timestamps
    end
  end
end

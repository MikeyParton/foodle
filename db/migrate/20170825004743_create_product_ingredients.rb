class CreateProductIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :product_ingredients do |t|
      t.references :product, index: true
      t.references :ingredient, index: true
      t.timestamps
    end
  end
end

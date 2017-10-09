class CreateProductBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :product_brands do |t|
      t.references :product, index: true
      t.references :brand, index: true
      t.timestamps
    end
  end
end

class AddCoreNutrientsDirectlyToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :energy, :integer
    add_column :products, :proteins, :integer
    add_column :products, :carbohydrates, :integer
    add_column :products, :fat, :integer
    add_column :products, :sugars, :integer
    add_column :products, :fiber, :integer
    add_column :products, :sodium, :integer
  end
end

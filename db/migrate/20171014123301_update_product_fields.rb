class UpdateProductFields < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :energy, :integer
    remove_column :products, :proteins, :integer
    remove_column :products, :carbohydrates, :integer
    remove_column :products, :fat, :integer
    remove_column :products, :sugars, :integer
    remove_column :products, :fiber, :integer
    remove_column :products, :sodium, :integer
    remove_column :products, :serving, :boolean
    remove_column :products, :serving_weight, :boolean

    add_column :products, :liquid, :boolean, default: false
    add_column :products, :serving_value, :integer
    add_column :products, :serving_unit, :string
  end
end

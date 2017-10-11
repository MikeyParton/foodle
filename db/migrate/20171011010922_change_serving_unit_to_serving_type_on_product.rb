class ChangeServingUnitToServingTypeOnProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :serving_value, :decimal, precision: 8, scale: 2
    remove_column :products, :serving_unit, :integer
    add_column :products, :serving, :integer
    add_column :products, :serving_weight, :boolean, default: true
  end
end

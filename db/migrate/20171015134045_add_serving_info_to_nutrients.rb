class AddServingInfoToNutrients < ActiveRecord::Migration[5.1]
  def change
    add_column :nutrients, :serving_value, :integer
    add_column :nutrients, :serving_unit, :string
  end
end

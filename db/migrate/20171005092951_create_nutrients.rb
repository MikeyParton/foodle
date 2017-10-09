class CreateNutrients < ActiveRecord::Migration[5.1]
  def change
    create_table :nutrients do |t|
      t.references :product, index: true
      t.integer :name, default: 0, null: false
      t.decimal :value, precision: 8, scale: 2
      t.integer :unit, default: 0, null: false
      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :serving_value, precision: 8, scale: 2
      t.integer :serving_unit, default: 0, null: false
      t.timestamps
    end
  end
end

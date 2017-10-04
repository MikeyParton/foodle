class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.timestamps
    end

    add_reference :products, :brand, index: true
  end
end

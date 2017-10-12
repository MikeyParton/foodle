class AddSourceToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :source, :integer, default: 0, allow_nil: false
  end
end

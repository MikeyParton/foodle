class CreateIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :identities do |t|
      t.references :user, index: true
      t.string :uid
      t.string :provider
      t.jsonb :info, null: false, default: '{}'
      t.timestamps
    end
  end
end

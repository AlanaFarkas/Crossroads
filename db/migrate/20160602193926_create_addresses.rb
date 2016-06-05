class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_1, null: false
      t.string :address_2
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :address_type
      t.references :user, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end

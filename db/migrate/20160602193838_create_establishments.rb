class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :name, null: false
      t.string :address_1, null: false
      t.string :address_2
      t.string :city, null: false
      t.string :state, null:false
      t.string :zip, null:false
      t.string :phone_number
      t.string :website

      t.timestamps null: false
    end
  end
end

class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true, index: true
      t.references :establishment, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end

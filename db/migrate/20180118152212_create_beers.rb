class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.float :plato
      t.integer :ibu
      t.float :abv
      t.float :price
      t.references :brewery, foreign_key: true
      t.references :style, foreign_key: true

      t.timestamps
    end
  end
end

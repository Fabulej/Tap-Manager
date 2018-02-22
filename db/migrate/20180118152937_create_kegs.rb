class CreateKegs < ActiveRecord::Migration[5.1]
  def change
    create_table :kegs do |t|
      t.date :expiration_date
      t.boolean :in_use
      t.references :beer, foreign_key: true

      t.timestamps
    end
  end
end

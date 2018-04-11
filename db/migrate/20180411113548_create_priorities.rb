class CreatePriorities < ActiveRecord::Migration[5.1]
  def change
    create_table :priorities do |t|
      t.boolean :wanted
      t.belongs_to :beer, foreign_key: true
      t.belongs_to :brewery, foreign_key: true
      t.belongs_to :style, foreign_key: true
      t.integer :p_type

      t.timestamps
    end
  end
end

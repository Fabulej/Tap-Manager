class CreateTaps < ActiveRecord::Migration[5.1]
  def change
    create_table :taps do |t|
      t.integer :number

      t.timestamps
    end
  end
end

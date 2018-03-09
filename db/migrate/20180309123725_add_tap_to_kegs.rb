class AddTapToKegs < ActiveRecord::Migration[5.1]
  def change
    add_reference :kegs, :tap, foreign_key: true
  end
end

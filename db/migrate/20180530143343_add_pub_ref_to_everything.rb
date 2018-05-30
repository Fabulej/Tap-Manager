class AddPubRefToEverything < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :pub, foreign_key: true
    add_reference :kegs, :pub, foreign_key: true
    add_reference :taps, :pub, foreign_key: true
  end
end

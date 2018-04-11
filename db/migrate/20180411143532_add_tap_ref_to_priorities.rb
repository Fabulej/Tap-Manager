class AddTapRefToPriorities < ActiveRecord::Migration[5.1]
  def change
    add_reference :priorities, :tap, foreign_key: true
  end
end

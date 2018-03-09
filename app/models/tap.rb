class Tap < ApplicationRecord
  before_create :set_number

  has_one :keg
  accepts_nested_attributes_for :keg, update_only: true

  def set_number
    self.number = Tap.all.count+1
  end
end

class Tap < ApplicationRecord
  before_create :set_number

  has_one :keg
  has_many :priorities
  accepts_nested_attributes_for :keg, update_only: true
  accepts_nested_attributes_for :priorities

  def set_number
    self.number = Tap.all.count+1
  end
end

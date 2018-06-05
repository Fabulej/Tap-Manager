class Pub < ApplicationRecord
  has_many :users
  has_many :taps
  has_many :kegs

  def avaiable_beers
    self.kegs.where(in_use: false).order('expiration_date desc').group('beer_id') - self.kegs.where(in_use: true)
  end
# Used to fix taps order
  # def reorder_taps
  #   self.taps.each_with_index do |t, i|
  #     t.update(number: i+1)
  #   end
  # end
end

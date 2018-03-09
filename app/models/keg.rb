class Keg < ApplicationRecord
  belongs_to :beer
  belongs_to :tap, optional: true

  before_save :keg_tapped?

  def keg_tapped?
    self.in_use = true if self.tap
  end

#zwraca po jednej beczce z każdego rodzaju o najkrótszej dacie ważności
  def self.avaiable_beers
    avaiable_beers = Keg.all.pluck(:beer_id).uniq.map! {|i| Keg.where(beer: i, in_use: false).order('expiration_date ASC').first}
    avaiable_beers.compact.map! {|b| b unless Keg.where(in_use: true).pluck(:beer_id).include? b.beer.id}
  end


  # def self.beer_picker(priority_one=nil, priority_two=nil, priority_three=nil)
  #   avaiable_beers = self.avaiable_beers
  #   if priority_one != nil
  #     results = avaiable_beers.select{|keg| keg.name == priority_one if keg!=nil}
  #   else
  #     results = avaiable_beers.select{|keg| keg.beer.style.name == priority_two if keg!=nil} unless priority_two == nil
  #     results = avaiable_beers.select{|keg| keg.beer.brewery.name == priority_three if keg!=nil} unless  priority_three == nil
  #   end
  #   results
  # end
end

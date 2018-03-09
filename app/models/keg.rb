class Keg < ApplicationRecord
  belongs_to :beer
  belongs_to :tap

#zwraca po jednej beczce z każdego rodzaju o najkrótszej dacie ważności
  def self.avaiable_beers
    avaiable_beers = Keg.all.pluck(:beer_id).uniq.map! {|i| Keg.where(beer: i, in_use: false).order('expiration_date ASC').first}
  end


  def self.beer_picker(priority_one=nil, priority_two=nil, priority_three=nil)
    avaiable_beers = self.avaiable_beers
    if priority_one != nil
      results = avaiable_beers.select{|keg| keg.name == priority_one if keg!=nil}
    else
      results = avaiable_beers.select{|keg| keg.beer.style.name == priority_two if keg!=nil} unless priority_two == nil
      results = avaiable_beers.select{|keg| keg.beer.brewery.name == priority_three if keg!=nil} unless  priority_three == nil
    end
    results.each {|keg| puts keg.beer.name + " " + keg.id.to_s + " " + keg.expiration_date.to_s }
  end
end

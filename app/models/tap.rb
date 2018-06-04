class Tap < ApplicationRecord
  before_save :set_number

  has_one :keg
  has_many :priorities
  belongs_to :pub
  accepts_nested_attributes_for :keg, update_only: true
  accepts_nested_attributes_for :priorities

  def set_number
    self.number = self.pub.taps.count+1
  end

  def beer_picker
    return Keg.avaiable_beers.where(beer_id: keg.beer_id).first if priorities.same_beer.any? && Keg.avaiable_beers.where(beer_id: keg.beer_id).any?
    results = priority_beers('wanted') - priority_beers('not_wanted')
    results = Keg.avaiable_beers.last(3) if results.empty?
    results
  end


  def priority_beers wanted
      beers = priorities.send(wanted).p_beers.pluck(:beer_id)
      beers = Keg.avaiable_beers.includes(:beer).where(beers: {id: beers})
      beers ||= []

      breweries = priorities.send(wanted).p_breweries.pluck(:brewery_id)
      breweries = Keg.avaiable_beers.includes(:beer).where(beers: {brewery_id: breweries})
      breweries ||= []

      styles = priorities.send(wanted).p_styles.pluck(:style_id)
      styles = Keg.avaiable_beers.includes(:beer).where(beers: {style_id: styles})
      styles ||= []

    if wanted == 'wanted'
      compared ||= beers + breweries + styles
      compared.each_with_index.map{|x, i| x if compared[i+1] == x}.compact
    else
      compared ||= beers + breweries + styles
    end
    compared.uniq
  end

end

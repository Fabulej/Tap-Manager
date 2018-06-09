class Keg < ApplicationRecord
  belongs_to :beer
  belongs_to :tap, optional: true
  belongs_to :pub

  before_save :keg_tapped?
  before_destroy :beer_continuation

  scope :avaiable_beers, -> {Keg.where(in_use: false).select('MIN(expiration_date), *').group('beer_id').where.not(beer_id: Keg.on_tap)}
  scope :on_tap, -> {Keg.where(in_use: true).pluck(:beer_id)}

  def keg_tapped?
    self.tap ? self.in_use = true : self.in_use = false
  end

  def beer_continuation
    if self.tap.priorities.where(p_type: "p_beer", beer: self.beer).any?
      self.tap.priorities.where(p_type: "p_beer", beer: self.beer).first.update(p_type: "same_beer")
    end
  end

  def expired?
    if expiration_date < Date.today
      "expired"
    elsif expiration_date <= Date.today+1.week
      "expired_soon"
    end
  end
end

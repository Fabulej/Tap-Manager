class Priority < ApplicationRecord
  belongs_to :brewery, optional: true
  belongs_to :beer, optional: true
  belongs_to :style, optional: true
  belongs_to :tap

  validates :beer_id, allow_blank: true, uniqueness: {scope: [:tap_id]}
  validates :brewery_id, allow_blank: true, uniqueness: {scope: [:tap_id]}
  validates :style_id, allow_blank: true, uniqueness: {scope: [:tap_id]}

  scope :wanted, -> {where(wanted: true)}
  scope :not_wanted, -> {where(wanted: false)}
  scope :p_beers, -> {where(p_type: :p_beer)}
  scope :p_breweries, -> {where(p_type: :p_brewery )}
  scope :p_styles, -> {where(p_type: :p_style )}

  enum p_type: {same_beer: 0, p_beer: 1, p_brewery: 2, p_style: 3}

  def prioritize
    wanted == true ? w = "Prioritize " : w = "Avoid "
    return w + "beer: " + beer.name if same_beer? || p_beer?
    return w + "brewery: " + brewery.name if p_brewery?
    return w + "style: " + style.name if p_style?
  end
end

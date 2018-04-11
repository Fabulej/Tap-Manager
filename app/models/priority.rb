class Priority < ApplicationRecord
  belongs_to :brewery, optional: true
  belongs_to :beer, optional: true
  belongs_to :style, optional: true

  enum p_type: {same_beer: 0, p_beer: 1, p_brewery: 2, p_style: 3}
end

class Priority < ApplicationRecord
  belongs_to :brewery, optional: true
  belongs_to :beer, optional: true
  belongs_to :style, optional: true
  belongs_to :tap
  validates_presence_of :wanted, default: true

  enum p_type: {same_beer: 0, p_beer: 1, p_brewery: 2, p_style: 3}

  def prioritize
    wanted == true ? w = "Prioritize " : w = "Avoid "
    return w + "beer: " + beer.name if p_type == "same_beer" || p_type ==  "p_beer"
    return w + "brewery: " + brewery.name if p_type == "p_brewery"
    return w + "style: " + style.name if p_type == "p_style"
  end
end

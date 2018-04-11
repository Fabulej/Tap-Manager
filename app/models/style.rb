class Style < ApplicationRecord
  has_many :beers
  has_many :priorities, -> {where(p_type: :p_style)}
end

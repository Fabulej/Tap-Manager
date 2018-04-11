class Brewery < ApplicationRecord
  has_many :beers
  has_many :priorities, -> {where(p_type: :p_brewery)}
end

class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :style
  has_many :kegs
  has_many :priorities, -> {where(p_type: :p_beer)}
end

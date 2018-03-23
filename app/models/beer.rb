class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :style
  has_many :kegs
end

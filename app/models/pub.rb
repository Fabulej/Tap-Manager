class Pub < ApplicationRecord
  has_many :users
  has_many :taps
  has_many :kegs
end

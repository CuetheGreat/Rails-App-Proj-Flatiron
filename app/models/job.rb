class Job < ApplicationRecord
  # - Associations
  has_many :bonuses
  has_many :characters
  has_many :races, through: :charactrers
end

class Race < ApplicationRecord
  # - Associations
  has_many :bonuses
  has_many :characters
  has_many :jobs, through: :characters
end

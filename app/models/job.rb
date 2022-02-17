class Job < ApplicationRecord
  # - Associations
  has_many :bonuses
  has_many :characters
  has_many :races, through: :charactrers

  validates :name, presence: true, uniqueness: true
end

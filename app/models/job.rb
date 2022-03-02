class Job < ApplicationRecord
  # - Associations
  has_many :bonuses
  has_many :characters
  has_many :races, through: :charactrers

  # - Validations
  validates :name, presence: true, uniqueness: true
end

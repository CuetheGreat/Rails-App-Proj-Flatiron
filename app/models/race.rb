class Race < ApplicationRecord
  # - Associations
  has_many :characters
  has_many :jobs, through: :characters

  # - Validations
  validates :name, uniqueness: true, presence: true
end

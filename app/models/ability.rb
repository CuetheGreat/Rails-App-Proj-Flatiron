class Ability < ApplicationRecord
  # - Associations
  belongs_to :character

  # - Validations
  validates :name, presence: true
end

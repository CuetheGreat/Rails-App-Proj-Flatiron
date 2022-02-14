class Ability < ApplicationRecor
  # - Associations
  belongs_to :character

  # - Validations
  validates :name, :value, presence: true
end

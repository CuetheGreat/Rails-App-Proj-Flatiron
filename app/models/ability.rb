class Ability < ApplicationRecord
  # - Associations
  belongs_to :character

  # - Validations
  validates :name, :value, presence: true

  # - Actions
  before_save :set_modifier

  private

  def set_modifier
    self.modifier = ((value - 10) / 2).floor
  end
end

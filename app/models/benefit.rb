class Benefit < ApplicationRecord
  # - Associations
  belongs_to :race

  # - Validations
  validates :name, :value, presence: true
  validates :value, numericality: { greater_than: 0, less_than_or_equal_to: 2 }

  # - Instance fuction
  def to_text
    "+#{value} to #{name}"
  end
end

class Benefit < ApplicationRecord
  belongs_to :race

  validates :name, :value, presence: true
  validates :value, numericality: { greater_than: 0, less_than_or_equal_to: 2 }

  def to_text
    "+#{value} to #{name}"
  end
end

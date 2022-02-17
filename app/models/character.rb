class Character < ApplicationRecord
  # - Associations
  belongs_to :user
  belongs_to :party
  belongs_to :race
  belongs_to :job
  has_many :abilities

  accepts_nested_attributes_for :abilities
  # - Validations
  validates :name, presence: true, uniqueness: true

  def build_nested
    %w[Strength Dexterity Constitution Wisdom Charisma Inteligence].each do |i|
      abilities.build(name: i, value: 10)
    end
  end
end

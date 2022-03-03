class Character < ApplicationRecord
  # - Associations
  belongs_to :user
  belongs_to :party
  belongs_to :race
  belongs_to :job
  has_many :abilities
  has_many :benefits, through: :race

  # - nested Attributes
  accepts_nested_attributes_for :abilities

  # - Validations
  validates :name, presence: true, uniqueness: true

  # - scope
  scope :is_alive, -> { where(alive: true) }
  scope :is_dead, -> { where(alive: false) }

  # - Instance Methods
  def build_nested
    %w[Strength Dexterity Constitution Wisdom Charisma Inteligence].each do |i|
      abilities.build(name: i, value: 10)
    end
  end

  def get_racial_bonus(ability)
    bonus = benefits.find_by(name: ability.name)
    bonus.nil? ? '-' : bonus.value
  end

  def ability_with_modifier(ability)
    bonus = benefits.find_by(name: ability.name)
    bonus.nil? ? ability.value : (ability.value + bonus.value)
  end

  def ability_modifier(ability)
    ((ability_with_modifier(ability) - 10) / 2).floor
  end
end

class Race < ApplicationRecord
  # - Associations
  has_many :benefits
  has_many :characters
  has_many :jobs, through: :characters

  # - Nested Attributes
  accepts_nested_attributes_for :benefits

  # - Validations
  validates :name, uniqueness: true, presence: true
end

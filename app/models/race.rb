class Race < ApplicationRecord
  # - Associations
  has_many :benefits
  has_many :characters
  has_many :jobs, through: :characters

  # - Validations
  validates :name, uniqueness: true, presence: true

  accepts_nested_attributes_for :benefits
end

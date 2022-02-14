class Character < ApplicationRecord
  # - Associations
  belongs_to :user
  belongs_to :party
  belongs_to :race
  belongs_to :job
  has_many :abilities

  # - Validations
  validates :name, presence: true
end

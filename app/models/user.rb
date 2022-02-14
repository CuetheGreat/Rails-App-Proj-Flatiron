class User < ApplicationRecord
  has_secure_password

  # - Validations
  validates :name, :password, :username, presence: true
  validates :username, uniqueness: true

  #- Associations
  has_many :characters
  has_many :parties, through: :characters
end

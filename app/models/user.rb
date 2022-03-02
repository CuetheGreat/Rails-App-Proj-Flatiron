class User < ApplicationRecord
  has_secure_password

  # - Validations
  validates :name, :username, presence: true
  validates :username, uniqueness: true
  validates :password, presence: true, confirmation: true, on: :create

  # - Associations
  has_many :characters
  has_many :parties, through: :characters
end

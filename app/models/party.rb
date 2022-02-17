class Party < ApplicationRecord
  # - Association
  has_many :members, class_name: 'Character'

  # - Validations
  validates :name, presence: true, uniqueness: true
  # - Public Methods
  def member_count
    members.length
  end

  # - Private Methods
end

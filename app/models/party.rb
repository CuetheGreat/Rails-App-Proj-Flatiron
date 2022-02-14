class Party < ApplicationRecord
  # - Association
  has_many :members, class_name: :characters

  # - Validations
  validates :name, presence: true

  # - Public Methods
  def member_count
    members.length
  end

  # - Private Methods
end

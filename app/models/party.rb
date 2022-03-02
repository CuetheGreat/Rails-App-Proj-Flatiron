class Party < ApplicationRecord
  # - Association
  has_many :members, class_name: 'Character'

  # - Validations
  validates :name, presence: true, uniqueness: true

  # - Intance Methods
  def member_count
    members.length
  end
end

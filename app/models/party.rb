class Party < ApplicationRecord
  # - Association
  has_many :members, class_name: :characters

  # - Class Methods
  def member_count
    members.length
  end
end

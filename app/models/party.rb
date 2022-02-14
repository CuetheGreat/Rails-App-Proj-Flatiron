class Party < ApplicationRecord
  has_many :members, class_name: :characters

  def member_count
    members.length
  end
end

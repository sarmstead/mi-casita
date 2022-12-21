class Person < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, unqueness: true
  validates_with StartsWithAt
end

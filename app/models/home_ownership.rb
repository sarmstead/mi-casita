class HomeOwnership < ApplicationRecord
  validates :person_id, presence: true
  validates :house_id, presence: true

  belongs_to :person
  belongs_to :house
end

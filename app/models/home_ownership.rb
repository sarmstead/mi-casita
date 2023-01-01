class HomeOwnership < ApplicationRecord
  validates :person_id, presence: true
  validates :house_id, presence: true
  validate :valid_instance?

  belongs_to :person
  belongs_to :house

  def valid_instance?
    errors.add :person_id, 'must be a valid record' if Person.find_by(id: person_id).nil?

    errors.add :house_id, 'must be a valid record' if House.find_by(id: house_id).nil?
  end
end

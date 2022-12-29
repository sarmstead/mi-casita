class Person < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validate :valid_username?

  def valid_username?
    errors.add :username, 'should begin with the @ symbol!' unless username.starts_with? '@'
  end
end

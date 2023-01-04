class House < ApplicationRecord
  validates :name, presence: true
  validates :exterior_color, presence: true, length: { within: 4..7 }
  validates :trim_color, presence: true, length: { within: 4..7 }
  validate :valid_color_value?

  has_many :home_ownerships
  has_many :people, through: :home_ownerships, dependent: :destroy
  has_many :windows, dependent: :destroy

  def valid_color_value?
    errors.add :exterior_color, 'should begin with the # symbol!' unless exterior_color.starts_with? '#'

    errors.add :trim_color, 'should begin with the # symbol!' unless trim_color.starts_with? '#'
  end
end

class House < ApplicationRecord
  validates :name, presence: true
  validates :exterior_color, presence: true
  validates :trim_color, presence: true

  has_many :home_ownerships
  has_many :people, through: :home_ownerships, dependent: :destroy
end

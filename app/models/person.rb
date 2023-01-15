class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validate :valid_username?

  has_many :home_ownerships
  has_many :houses, through: :home_ownerships, dependent: :destroy

  def valid_username?
    errors.add :username, 'should begin with the @ symbol!' unless username.starts_with? '@'
  end
end

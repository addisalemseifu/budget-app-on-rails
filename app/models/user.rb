class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups
  has_many :entities
  has_many :group_entities, through: :groups
  has_many :group_entities, through: :entities

  # Validations
  validates :name, presence: true
end

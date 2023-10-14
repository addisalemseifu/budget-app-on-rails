class User < ApplicationRecord
  has_many :groups
  has_many :entities
  has_many :group_entities, through: :groups
  has_many :group_entities, through: :entities

  # Validations
  validates :name, presence: true
end

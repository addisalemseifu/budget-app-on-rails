class Entity < ApplicationRecord
  belongs_to :user
  has_many :group_entities

  # Validations
  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

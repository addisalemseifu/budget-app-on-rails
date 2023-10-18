class Group < ApplicationRecord
  belongs_to :user
  has_many :group_entities

  # Validations
  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    @group_entities = group_entities
    @total_amount = 0
    @total = @group_entities.each do |group_entity|
      @total_amount += group_entity.entity.amount
    end
    @total_amount
  end

  def sorted_entities
    @group_entities = group_entities
    @sorted_entities = @group_entities.order(created_at: :desc)
    @sorted_entities
  end
end

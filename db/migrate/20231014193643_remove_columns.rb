class RemoveColumns < ActiveRecord::Migration[7.0]
  def self.up
    remove_column :group_entities, :amount
  end

  def self.down
    add_column :group_entities, :amount, :integer
  end
end

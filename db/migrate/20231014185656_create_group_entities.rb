class CreateGroupEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :group_entities do |t|
      t.references :group, null: false, foreign_key: true
      t.references :entity, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end

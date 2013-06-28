class CreateRarities < ActiveRecord::Migration
  def up
    create_table :rarities do |t|
      t.string :name
      t.timestamps
    end

    add_column :cards, :rarity_id, :integer, :default => 1
  end

  def down
    drop_table :rarities
  end
end

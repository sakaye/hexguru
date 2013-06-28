class CreateRarities < ActiveRecord::Migration
  def up
    create_table :rarities do |t|
      t.string :name
      t.timestamps
    end

    remove_column :cards, :rarity
    add_column :cards, :rarity_id, :integer
  end

  def down
    drop_table :rarities
  end
end

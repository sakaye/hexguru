class AddDefaultsToCards < ActiveRecord::Migration
  def up
    change_column :cards, :color_id, :integer, :default => 1
    change_column :cards, :rarity_id, :integer, :default => 1
    change_column :cards, :faction_id, :integer, :default => 1
  end

  def down
    change_column :cards, :color_id, :integer, :default => nil
    change_column :cards, :rarity_id, :integer, :default => nil
    change_column :cards, :faction_id, :integer, :default => nil
  end
end

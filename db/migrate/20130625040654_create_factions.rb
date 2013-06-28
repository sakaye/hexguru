class CreateFactions < ActiveRecord::Migration
  def up
    create_table :factions do |t|
      t.string :name
      t.timestamps
    end

    add_column :cards, :faction_id, :integer, :default => 1
  end

  def down
    drop_table :factions
  end
end

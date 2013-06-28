class CreateFactions < ActiveRecord::Migration
  def up
    create_table :factions do |t|
      t.string :name
      t.timestamps
    end

    remove_column :cards, :faction
    add_column :cards, :faction_id, :integer
  end

  def down
    drop_table :factions
  end
end

class CreateFactions < ActiveRecord::Migration
  def up
    create_table :factions do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :factions
  end
end

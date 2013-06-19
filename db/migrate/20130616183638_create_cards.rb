class CreateCards < ActiveRecord::Migration
  def up
    create_table :cards do |t|
      t.string :name
      t.string :color
      t.integer :cost
      t.string :card_type
      t.string :rarity
      t.boolean :game_type
      t.string :trait
      t.text :game_text
      t.text :lore_text
      t.string :restriction
      t.string :faction
      t.string :image
      t.integer :attack
      t.integer :defense
      t.integer :set_number
      t.integer :related_equipment

      t.timestamps
    end

    add_index :cards, :name
    add_index :cards, :color
    add_index :cards, :set_number
    add_index :cards, :trait
  end

  def down
    drop_table :cards
  end
end

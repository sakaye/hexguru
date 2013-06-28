class CreateCards < ActiveRecord::Migration
  def up
    create_table :cards do |t|
      t.string :name
      t.integer :cost
      t.boolean :game_type
      t.text :game_text
      t.text :lore_text
      t.boolean :restriction
      t.string :image
      t.integer :attack
      t.integer :defense

      t.timestamps
    end
  end

  def down
    drop_table :cards
  end
end

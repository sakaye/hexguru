class CreateTraits < ActiveRecord::Migration
  def up
    create_table :traits do |t|
      t.string :name
      t.timestamps
    end
    create_table :cards_traits, id: false do |t|
      t.integer :card_id
      t.integer :trait_id
    end
  end

  def down
    drop_table :traits
    drop_table :cards_traits
  end
end

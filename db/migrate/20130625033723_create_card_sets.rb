class CreateCardSets < ActiveRecord::Migration
  def up
    create_table :collections do |t|
      t.string :name
      t.timestamps
    end

    create_table :cards_collections, id: false do |t|
      t.integer :card_id
      t.integer :collection_id
    end

    remove_column :cards, :card_set
  end

  def down
    drop_table :collections
    drop_table :cards_collections
  end
end

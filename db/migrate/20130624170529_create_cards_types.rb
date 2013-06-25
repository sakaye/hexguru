class CreateCardsTypes < ActiveRecord::Migration
  def up
    create_table :cards_types, id: false do |t|
      t.integer :card_id
      t.integer :type_id
    end
  end

  def down
    drop_table :cards_types
  end
end

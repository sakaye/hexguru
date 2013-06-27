class CreateKeywords < ActiveRecord::Migration
  def up
    create_table :keywords do |t|
      t.string :name
      t.timestamps
    end

    create_table :cards_keywords, id: false do |t|
      t.integer :card_id
      t.integer :keyword_id
    end
  end

  def down
    drop_table :keywords
    drop_table :cards_keywords
  end
end

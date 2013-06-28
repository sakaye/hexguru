class CreateTypes < ActiveRecord::Migration
  def up
    create_table :types do |t|
      t.string :name
      t.timestamps
    end

    remove_column :cards, :card_type
  end

  def down
    drop_table :types
  end
end

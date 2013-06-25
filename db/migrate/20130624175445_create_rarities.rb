class CreateRarities < ActiveRecord::Migration
  def up
    create_table :rarities do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :rarities
  end
end

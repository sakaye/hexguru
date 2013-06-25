class CreateEquipment < ActiveRecord::Migration
  def up
    create_table :equipment do |t|
      t.string :name
      t.text :game_text
      t.integer :type_id
      t.timestamps
    end
  end

  def down
    drop_table :equipment
  end
end

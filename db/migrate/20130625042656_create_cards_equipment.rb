class CreateCardsEquipment < ActiveRecord::Migration
  def up
    create_table :cards_equipment, id: false do |t|
      t.integer :card_id
      t.integer :equipment_id
    end
  end

  def down
    drop_table :cards_equipment
  end
end

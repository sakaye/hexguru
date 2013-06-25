class AddTypeidtoCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.remove :card_type
      t.integer :type_id
    end
  end
end

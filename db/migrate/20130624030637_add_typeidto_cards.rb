class AddTypeidtoCards < ActiveRecord::Migration
  def up
    change_table :cards do |t|
      t.integer :type_id
    end
  end

  def down
  end
end

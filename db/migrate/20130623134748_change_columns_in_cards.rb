class ChangeColumnsInCards < ActiveRecord::Migration
  def up
    change_table :cards do |t|
      t.integer :color_id, :default => 1
    end
  end

  def down
  end

end

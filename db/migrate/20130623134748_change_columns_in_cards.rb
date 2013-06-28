class ChangeColumnsInCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.remove :color
      t.integer :color_id, :default => 1
    end
  end

end

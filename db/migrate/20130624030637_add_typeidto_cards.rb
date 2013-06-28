class AddTypeidtoCards < ActiveRecord::Migration
  def change
    change_table :cards do |t|
      t.integer :type_id
    end
  end
end

class ChangeGameTypeinCards < ActiveRecord::Migration
  def up
    change_column :cards, :game_type, :boolean
  end

  def down
    change_column :cards, :game_type, :string
  end
end

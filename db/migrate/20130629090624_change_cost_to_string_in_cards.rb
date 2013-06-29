class ChangeCostToStringInCards < ActiveRecord::Migration
  def up
    change_column :cards, :cost, :string
  end

  def down
    change_column :cards, :cost, :integer
  end
end

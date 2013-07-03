class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer :card_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end

    add_index :comments, [:card_id, :user_id, :created_at]
  end

  def down
    drop_table :comments
  end
end

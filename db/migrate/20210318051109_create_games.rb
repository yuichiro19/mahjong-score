class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :guest1, null: false
      t.string :guest2, null: false
      t.string :guest3, null: false
      t.integer :rank_bonus_id, null: false
      t.integer :top_bonus_id, null: false
      t.integer :rate_id, null: false
      t.integer :chip, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

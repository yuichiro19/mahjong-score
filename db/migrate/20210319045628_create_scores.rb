class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.integer :user_score, null: false
      t.integer :guest1_score, null: false
      t.integer :guest2_score, null: false
      t.integer :guest3_score, null: false
      t.integer :user_rank, null: false
      t.integer :guest1_rank, null: false
      t.integer :guest2_rank, null: false
      t.integer :guest3_rank, null: false
      t.integer :user_point, null: false
      t.integer :guest1_point, null: false
      t.integer :guest2_point, null: false
      t.integer :guest3_point, null: false
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.timestamps
    end
  end
end

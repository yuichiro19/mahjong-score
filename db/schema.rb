# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_19_045628) do

  create_table "games", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "guest1", null: false
    t.string "guest2", null: false
    t.string "guest3", null: false
    t.integer "rank_bonus_id", null: false
    t.integer "top_bonus_id", null: false
    t.integer "rate_id", null: false
    t.integer "chip", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "scores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_score", null: false
    t.integer "guest1_score", null: false
    t.integer "guest2_score", null: false
    t.integer "guest3_score", null: false
    t.integer "user_rank_id", null: false
    t.integer "guest1_rank_id", null: false
    t.integer "guest2_rank_id", null: false
    t.integer "guest3_rank_id", null: false
    t.integer "user_point", null: false
    t.integer "guest1_point", null: false
    t.integer "guest2_point", null: false
    t.integer "guest3_point", null: false
    t.bigint "user_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_scores_on_game_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "users"
  add_foreign_key "scores", "games"
  add_foreign_key "scores", "users"
end

# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160708043522) do

  create_table "comments", force: :cascade do |t|
    t.integer  "news_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["news_id"], name: "index_comments_on_news_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "league_seasons", force: :cascade do |t|
    t.integer  "year"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "league_seasons", ["league_id"], name: "index_league_seasons_on_league_id"

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "leagues", ["country_id"], name: "index_leagues_on_country_id"

  create_table "match_events", force: :cascade do |t|
    t.integer  "match_id"
    t.text     "content"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "match_events", ["match_id"], name: "index_match_events_on_match_id"

  create_table "matches", force: :cascade do |t|
    t.integer  "league_season_id"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "team1_goal"
    t.integer  "team2_goal"
    t.float    "team1_odds"
    t.float    "team2_odds"
    t.float    "draw_odds"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "matches", ["league_season_id"], name: "index_matches_on_league_season_id"

  create_table "news", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "brief_description"
    t.text     "content"
    t.string   "author"
    t.integer  "news_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "news", ["news_type_id"], name: "index_news_on_news_type_id"
  add_index "news", ["user_id"], name: "index_news_on_user_id"

  create_table "news_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_awards", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "nameLstring"
    t.integer  "league_season_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "player_awards", ["league_season_id"], name: "index_player_awards_on_league_season_id"
  add_index "player_awards", ["player_id"], name: "index_player_awards_on_player_id"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.text     "introduction"
    t.integer  "position"
    t.integer  "team_id"
    t.datetime "data_of_birth"
    t.string   "avatar"
    t.integer  "country_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "players", ["country_id"], name: "index_players_on_country_id"
  add_index "players", ["team_id"], name: "index_players_on_team_id"

  create_table "season_teams", force: :cascade do |t|
    t.integer  "league_season_id"
    t.integer  "team_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "season_teams", ["league_season_id"], name: "index_season_teams_on_league_season_id"
  add_index "season_teams", ["team_id"], name: "index_season_teams_on_team_id"

  create_table "team_achievements", force: :cascade do |t|
    t.string   "name"
    t.integer  "season_team_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "team_achievements", ["season_team_id"], name: "index_team_achievements_on_season_team_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.string   "logo"
    t.text     "introduction"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "teams", ["country_id"], name: "index_teams_on_country_id"

  create_table "user_bets", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "user_id"
    t.integer  "coin"
    t.integer  "chosen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_bets", ["match_id"], name: "index_user_bets_on_match_id"
  add_index "user_bets", ["user_id"], name: "index_user_bets_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar"
    t.integer  "role"
    t.integer  "coin"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

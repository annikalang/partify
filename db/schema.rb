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

ActiveRecord::Schema.define(version: 2019_08_29_144759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parties", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.float "danceability"
    t.float "tempo"
    t.float "energy"
    t.float "valence"
    t.integer "popularity"
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_energy", default: 0
    t.integer "max_energy", default: 100
    t.integer "min_popularity", default: 0
    t.integer "max_popularity", default: 100
    t.integer "max_danceability", default: 100
    t.integer "min_danceability", default: 0
    t.integer "max_valence", default: 100
    t.integer "min_valence", default: 0
    t.index ["party_id"], name: "index_playlists_on_party_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.integer "duration_ms"
    t.string "image"
    t.float "danceability"
    t.float "tempo"
    t.float "energy"
    t.float "valence"
    t.integer "popularity"
    t.string "spotify_id"
    t.bigint "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "artist"
    t.string "genre"
    t.index ["playlist_id"], name: "index_tracks_on_playlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "display_name"
    t.string "spotify_id"
    t.string "image"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "parties", "users"
  add_foreign_key "playlists", "parties"
  add_foreign_key "tracks", "playlists"
end

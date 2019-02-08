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

ActiveRecord::Schema.define(version: 2019_01_24_053039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directors", force: :cascade do |t|
    t.text "name"
    t.date "dob"
    t.text "image"
    t.text "nationality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "films", force: :cascade do |t|
    t.text "title"
    t.text "director"
    t.date "release_date"
    t.text "genre"
    t.text "country"
    t.integer "runtime"
    t.text "image"
    t.text "plot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "director_id"
    t.float "rating"
  end

  create_table "films_genres", force: :cascade do |t|
    t.integer "film_id"
    t.integer "genre_id"
  end

  create_table "films_lists", force: :cascade do |t|
    t.integer "film_id"
    t.integer "list_id"
  end

  create_table "genres", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.text "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "film_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "volume"
    t.integer "stars"
    t.text "review"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "password_digest"
    t.boolean "admin", default: false
  end

end

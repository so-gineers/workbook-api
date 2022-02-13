# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_13_092347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  # These are custom enum types that must be created before they can be used in the schema definition
  create_enum "person_title", ["mr", "mme"]
  create_enum "teacher_status", ["pending", "active", "banned", "locked"]

  create_table "db_teachers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.enum "status", default: "pending", as: "teacher_status"
    t.enum "person_title", null: false, as: "person_title"
    t.datetime "banned_at"
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "locked_at"
    t.string "phone_number", null: false
    t.string "bio"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

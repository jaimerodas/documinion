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

ActiveRecord::Schema.define(version: 2019_10_30_175515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "document_templates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", limit: 512, null: false
    t.text "liquid_text"
    t.jsonb "user_vars", default: [], null: false
    t.jsonb "local_vars", default: [], null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_document_templates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 512
    t.string "apple_uid", limit: 512
    t.jsonb "vars", default: {}, null: false
    t.jsonb "min_vars", default: [], null: false
    t.jsonb "settings"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "document_templates", "users"
end

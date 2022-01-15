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

ActiveRecord::Schema.define(version: 2021_12_24_153505) do

  create_table "adapter_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "adapters", force: :cascade do |t|
    t.text "name"
    t.integer "vendor_id", null: false
    t.integer "adapter_type_id", null: false
    t.integer "connection_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["adapter_type_id"], name: "index_adapters_on_adapter_type_id"
    t.index ["connection_type_id"], name: "index_adapters_on_connection_type_id"
    t.index ["vendor_id"], name: "index_adapters_on_vendor_id"
  end

  create_table "connection_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "adapters", "adapter_types"
  add_foreign_key "adapters", "connection_types"
  add_foreign_key "adapters", "vendors"
end

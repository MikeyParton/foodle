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

ActiveRecord::Schema.define(version: 20171005092951) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.bigint "user_id"
    t.string "uid"
    t.string "provider"
    t.jsonb "info", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.text "string"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nutrition_information_rows", force: :cascade do |t|
    t.bigint "nutrition_information_id"
    t.integer "nutrient", default: 0, null: false
    t.decimal "value", precision: 5, scale: 2
    t.integer "units", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutrition_information_id"], name: "index_nutrition_information_rows_on_nutrition_information_id"
  end

  create_table "nutrition_informations", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "serving_value"
    t.integer "serving_units", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_nutrition_informations_on_product_id"
  end

  create_table "product_ingredients", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "ingredient_id"
    t.decimal "quantity", precision: 8, scale: 2
    t.integer "units"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_product_ingredients_on_ingredient_id"
    t.index ["product_id"], name: "index_product_ingredients_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "barcode"
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
  end

end

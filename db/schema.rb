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

ActiveRecord::Schema.define(version: 20160905051606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_favorites_on_recipe_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "followings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "follower"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_followings_on_user_id", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "photo"
    t.text     "info"
    t.integer  "calories"
    t.integer  "fat_calories"
    t.float    "cholesterol"
    t.float    "sodium"
    t.float    "sugar"
    t.float    "protein"
    t.float    "carbohydrates"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ingredient_id"
    t.integer  "count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["ingredient_id"], name: "index_preferences_on_ingredient_id", using: :btree
    t.index ["user_id"], name: "index_preferences_on_user_id", using: :btree
  end

  create_table "recipe_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.text     "comment"
    t.date     "created"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_comments_on_recipe_id", using: :btree
    t.index ["user_id"], name: "index_recipe_comments_on_user_id", using: :btree
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id", using: :btree
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id", using: :btree
  end

  create_table "recipe_scores", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_scores_on_recipe_id", using: :btree
    t.index ["user_id"], name: "index_recipe_scores_on_user_id", using: :btree
  end

  create_table "recipe_tags", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_tags_on_recipe_id", using: :btree
    t.index ["tag_id"], name: "index_recipe_tags_on_tag_id", using: :btree
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.integer  "cook_time"
    t.integer  "calories"
    t.float    "score"
    t.date     "created"
    t.integer  "type_dish_id"
    t.integer  "type_food_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["type_dish_id"], name: "index_recipes_on_type_dish_id", using: :btree
    t.index ["type_food_id"], name: "index_recipes_on_type_food_id", using: :btree
    t.index ["user_id"], name: "index_recipes_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_dishes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_foods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "favorites", "recipes"
  add_foreign_key "favorites", "users"
  add_foreign_key "followings", "users"
  add_foreign_key "preferences", "ingredients"
  add_foreign_key "preferences", "users"
  add_foreign_key "recipe_comments", "recipes"
  add_foreign_key "recipe_comments", "users"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "recipe_scores", "recipes"
  add_foreign_key "recipe_scores", "users"
  add_foreign_key "recipe_tags", "recipes"
  add_foreign_key "recipe_tags", "tags"
  add_foreign_key "recipes", "type_dishes"
  add_foreign_key "recipes", "type_foods"
  add_foreign_key "recipes", "users"
end

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

ActiveRecord::Schema[7.0].define(version: 2022_09_08_165411) do
  create_table "acounts", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.date "fecha"
    t.text "description"
    t.decimal "importe", precision: 10, scale: 2
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_acounts_on_client_id"
  end

  create_table "articles", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "category"
    t.string "slug"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "apellido"
    t.string "cel"
    t.string "direccion"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "extents", charset: "utf8mb4", force: :cascade do |t|
    t.string "extent"
    t.string "slug"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", charset: "utf8mb4", force: :cascade do |t|
    t.integer "cantidad"
    t.bigint "sale_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_items_on_product_id"
    t.index ["sale_id"], name: "index_items_on_sale_id"
  end

  create_table "marks", charset: "utf8mb4", force: :cascade do |t|
    t.string "mark"
    t.string "slug"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movimients", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "type"
    t.integer "cant"
    t.text "coment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_movimients_on_product_id"
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.string "name_p"
    t.text "description"
    t.bigint "category_id", null: false
    t.bigint "mark_id", null: false
    t.bigint "extent_id", null: false
    t.string "code"
    t.integer "stok"
    t.decimal "precio", precision: 10, scale: 2
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["extent_id"], name: "index_products_on_extent_id"
    t.index ["mark_id"], name: "index_products_on_mark_id"
  end

  create_table "sales", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "client_id", null: false
    t.date "fecha"
    t.decimal "total", precision: 12, scale: 2
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "acounts", "clients"
  add_foreign_key "comments", "articles"
  add_foreign_key "items", "products"
  add_foreign_key "items", "sales"
  add_foreign_key "movimients", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "extents"
  add_foreign_key "products", "marks"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "users"
end

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

ActiveRecord::Schema.define(version: 20160416210044) do

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.decimal  "balance"
    t.integer  "user_id"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "categories", force: true do |t|
    t.string   "description"
    t.string   "summary"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.string   "description"
    t.integer  "account_id"
    t.integer  "user_id"
    t.decimal  "amount"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["account_id"], name: "index_expenses_on_account_id"
  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id"

  create_table "families", force: true do |t|
    t.string   "name",       null: false
    t.string   "pass",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incomes", force: true do |t|
    t.string   "description"
    t.decimal  "income"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "title"
    t.date     "date"
  end

  add_index "incomes", ["account_id"], name: "index_incomes_on_account_id"
  add_index "incomes", ["user_id"], name: "index_incomes_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.integer  "family_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["family_id"], name: "index_users_on_family_id"

end

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

ActiveRecord::Schema.define(version: 20171023143115) do

  create_table "admin_denemes", force: :cascade do |t|
    t.integer "sinif"
    t.string "uniteadi"
    t.string "denemeadi"
    t.text "aciklama"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dosya_file_name"
    t.string "dosya_content_type"
    t.integer "dosya_file_size"
    t.datetime "dosya_updated_at"
  end

  create_table "admin_konuanlatimis", force: :cascade do |t|
    t.integer "sinif"
    t.string "uniteadi"
    t.string "kavram"
    t.text "metin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "konuadi"
    t.string "dosya_file_name"
    t.string "dosya_content_type"
    t.integer "dosya_file_size"
    t.datetime "dosya_updated_at"
  end

  create_table "admin_materyals", force: :cascade do |t|
    t.integer "sinif"
    t.string "uniteadi"
    t.integer "materyaltur"
    t.string "materyaladi"
    t.text "materyalaciklama"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_projes", force: :cascade do |t|
    t.string "projeadi"
    t.text "projeaciklama"
    t.text "kisi"
    t.text "kavram"
    t.text "nasil"
    t.text "sonuc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ek_file_name"
    t.string "ek_content_type"
    t.integer "ek_file_size"
    t.datetime "ek_updated_at"
  end

  create_table "admin_unites", force: :cascade do |t|
    t.string "uniteadi"
    t.text "aciklama"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sinif"
    t.string "uniteresmi_file_name"
    t.string "uniteresmi_content_type"
    t.integer "uniteresmi_file_size"
    t.datetime "uniteresmi_updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

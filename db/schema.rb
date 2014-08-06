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

ActiveRecord::Schema.define(version: 20140806200205) do

  create_table "addresses", force: true do |t|
    t.string   "country"
    t.string   "city"
    t.string   "region"
    t.string   "address"
    t.integer  "zip"
    t.string   "phone"
    t.string   "website"
    t.string   "email"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["zip"], name: "index_addresses_on_zip", using: :btree

  create_table "assignments", force: true do |t|
    t.integer  "project_id"
    t.integer  "person_id"
    t.string   "role"
    t.string   "description"
    t.date     "since"
    t.date     "till"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["person_id"], name: "index_assignments_on_person_id", using: :btree
  add_index "assignments", ["project_id"], name: "index_assignments_on_project_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: true do |t|
    t.integer  "project_id"
    t.integer  "skill_id"
    t.integer  "person_id"
    t.integer  "rate"
    t.integer  "days"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["person_id"], name: "index_experiences_on_person_id", using: :btree
  add_index "experiences", ["project_id"], name: "index_experiences_on_project_id", using: :btree
  add_index "experiences", ["skill_id"], name: "index_experiences_on_skill_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "since"
    t.date     "till"
    t.integer  "company_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree
  add_index "jobs", ["person_id"], name: "index_jobs_on_person_id", using: :btree
  add_index "jobs", ["type_id"], name: "index_jobs_on_type_id", using: :btree

  create_table "pages", force: true do |t|
    t.string   "slug"
    t.string   "title"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "nickname"
    t.string   "slug"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "customer_id"
    t.integer  "provider_id"
    t.string   "team"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "started"
    t.date     "finished"
  end

  add_index "projects", ["customer_id"], name: "index_projects_on_customer_id", using: :btree
  add_index "projects", ["finished"], name: "index_projects_on_finished", using: :btree
  add_index "projects", ["provider_id"], name: "index_projects_on_provider_id", using: :btree
  add_index "projects", ["started"], name: "index_projects_on_started", using: :btree

  create_table "skill_categories", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "rate"
    t.integer  "skill_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

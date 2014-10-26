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

ActiveRecord::Schema.define(version: 20141026084129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.text     "description"
    t.date     "since"
    t.date     "till"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["person_id"], name: "index_assignments_on_person_id", using: :btree
  add_index "assignments", ["project_id"], name: "index_assignments_on_project_id", using: :btree

  create_table "certifications", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "day_passed"
    t.string   "link"
    t.float    "value"
    t.float    "max_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: true do |t|
    t.integer  "assignment_id"
    t.integer  "skill_id"
    t.integer  "person_id"
    t.integer  "rate"
    t.integer  "days"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["assignment_id"], name: "index_experiences_on_assignment_id", using: :btree
  add_index "experiences", ["person_id"], name: "index_experiences_on_person_id", using: :btree
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
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "summary"
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true, using: :btree
  add_index "people", ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true, using: :btree

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

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

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end

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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101227022055) do

  create_table "countries", :force => true do |t|
    t.string   "abbrev"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_uid"
    t.string   "image_ext"
  end

  create_table "inquiries", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.integer  "position"
    t.boolean  "open",       :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "spam",       :default => false
  end

  create_table "inquiry_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_parts", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_parts", ["id"], :name => "index_page_parts_on_id"
  add_index "page_parts", ["page_id"], :name => "index_page_parts_on_page_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.integer  "position"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_keywords"
    t.text     "meta_description"
    t.boolean  "show_in_menu",        :default => true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           :default => true
    t.string   "custom_title"
    t.string   "custom_title_type",   :default => "none"
    t.boolean  "draft",               :default => false
    t.string   "browser_title"
    t.boolean  "skip_to_first_child", :default => false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "cached_slug"
  end

  add_index "pages", ["depth"], :name => "index_pages_on_depth"
  add_index "pages", ["id"], :name => "index_pages_on_id"
  add_index "pages", ["lft"], :name => "index_pages_on_lft"
  add_index "pages", ["parent_id"], :name => "index_pages_on_parent_id"
  add_index "pages", ["rgt"], :name => "index_pages_on_rgt"

  create_table "proposals", :force => true do |t|
    t.string   "title"
    t.string   "speaker_name"
    t.string   "speaker_email"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_settings", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scoping"
    t.boolean  "restricted",              :default => false
    t.string   "callback_proc_as_string"
    t.string   "form_value_type"
  end

  add_index "refinery_settings", ["name"], :name => "index_refinery_settings_on_name"

  create_table "resources", :force => true do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_uid"
    t.string   "file_ext"
  end

  create_table "roles", :force => true do |t|
    t.string "title"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id"
  add_index "roles_users", ["user_id", "role_id"], :name => "index_roles_users_on_user_id_and_role_id"

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope",          :limit => 40
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "scope", "sequence"], :name => "index_slugs_on_name_and_sluggable_type_and_scope_and_sequence", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "speakers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "bio"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speakers_talks", :id => false, :force => true do |t|
    t.integer "speaker_id"
    t.integer "talk_id"
  end

  create_table "states", :force => true do |t|
    t.string   "abbrev"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talk_lengths", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talk_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talks", :force => true do |t|
    t.string   "title"
    t.text     "abstract"
    t.text     "prereqs"
    t.text     "comments"
    t.text     "av_requirement"
    t.integer  "talk_type_id"
    t.integer  "talk_length_id"
    t.integer  "video_approval_id"
    t.integer  "track_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", :force => true do |t|
    t.string   "abbrev"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_plugins", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "user_plugins", ["name"], :name => "index_user_plugins_on_title"
  add_index "user_plugins", ["user_id", "name"], :name => "index_unique_user_plugins", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",             :null => false
    t.string   "email",             :null => false
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "perishable_token"
  end

  add_index "users", ["id"], :name => "index_users_on_id"

  create_table "video_approvals", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

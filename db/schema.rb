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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120821225543) do

  create_table "activities", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "albums", :force => true do |t|
    t.integer  "user_id"
    t.string   "album_artwork_file_name"
    t.string   "album_artwork_content_type"
    t.integer  "album_artwork_file_size"
    t.datetime "album_artwork_updated_at"
    t.text     "album_title"
    t.decimal  "price",                      :precision => 8, :scale => 2
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  create_table "carts", :force => true do |t|
    t.datetime "purchased_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "credits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "user_credits"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "fan_bases", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "fb_art_file_name"
    t.string   "fb_art_content_type"
    t.integer  "fb_art_file_size"
    t.datetime "fb_art_updated_at"
    t.string   "type_of_music_entity"
    t.string   "verification"
    t.text     "status_message"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "fan_relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "fan_relationships", ["followed_id"], :name => "index_fan_relationships_on_followed_id"
  add_index "fan_relationships", ["follower_id", "followed_id"], :name => "index_fan_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "fan_relationships", ["follower_id"], :name => "index_fan_relationships_on_follower_id"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "labels", :force => true do |t|
    t.integer  "fan_base_id"
    t.string   "name"
    t.string   "label_image_file_name"
    t.string   "label_image_content_type"
    t.integer  "label_image_file_size"
    t.datetime "label_image_updated_at"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "master_song_id"
    t.integer  "cart_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "quantity",       :default => 1
    t.decimal  "price"
  end

  create_table "master_song_comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "master_song_id"
    t.text     "comment"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "master_song_relationships", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "owned_id"
    t.boolean  "favorite"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "master_song_relationships", ["owned_id"], :name => "index_master_song_relationships_on_owned_id"
  add_index "master_song_relationships", ["owner_id", "owned_id"], :name => "index_master_song_relationships_on_owner_id_and_owned_id", :unique => true
  add_index "master_song_relationships", ["owner_id"], :name => "index_master_song_relationships_on_owner_id"

  create_table "master_songs", :force => true do |t|
    t.integer  "user_id"
    t.string   "m_song_file_name"
    t.string   "m_song_content_type"
    t.integer  "m_song_file_size"
    t.datetime "m_song_updated_at"
    t.string   "song_art_work_file_name"
    t.string   "song_art_work_content_type"
    t.integer  "song_art_work_file_size"
    t.datetime "song_art_work_updated_at"
    t.decimal  "price",                      :precision => 8, :scale => 2
    t.integer  "song_listens_count",                                       :default => 0
    t.integer  "song_up_votes_count",                                      :default => 0
    t.integer  "master_song_comments_count",                               :default => 0
    t.string   "m_song_fingerprint"
    t.datetime "release_date"
    t.string   "title"
    t.string   "artist"
    t.string   "album_title"
    t.integer  "album_id"
    t.integer  "length"
    t.string   "slug"
    t.boolean  "playable",                                                 :default => true
    t.datetime "created_at",                                                                 :null => false
    t.datetime "updated_at",                                                                 :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "cart_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.string   "country"
    t.text     "billing_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "read_marks", :force => true do |t|
    t.integer  "readable_id"
    t.integer  "user_id",                     :null => false
    t.string   "readable_type", :limit => 20, :null => false
    t.datetime "timestamp"
  end

  add_index "read_marks", ["user_id", "readable_type", "readable_id"], :name => "index_read_marks_on_user_id_and_readable_type_and_readable_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "searches", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "song_listens", :force => true do |t|
    t.integer  "user_id"
    t.integer  "listenable_id"
    t.string   "listenable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "song_up_votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "master_song_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "user_access_requests", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_seller_accounts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_song_uploads", :force => true do |t|
    t.integer  "user_id"
    t.string   "song_file_name"
    t.string   "song_content_type"
    t.integer  "song_file_size"
    t.datetime "song_updated_at"
    t.boolean  "favorite"
    t.string   "song_fingerprint"
    t.integer  "song_listens_count", :default => 0
    t.string   "title"
    t.string   "artist"
    t.string   "album"
    t.integer  "length"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                   :default => "", :null => false
    t.string   "encrypted_password",      :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "username"
    t.string   "user_type"
    t.string   "location"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "facebook_image"
    t.string   "provider"
    t.string   "uid"
    t.string   "last_seen_at"
    t.integer  "credit_balance"
    t.string   "user_image_file_name"
    t.string   "user_image_content_type"
    t.integer  "user_image_file_size"
    t.datetime "user_image_updated_at"
    t.integer  "fan_score_count",         :default => 0
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end

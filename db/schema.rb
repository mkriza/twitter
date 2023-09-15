# rubocop:disable all

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

ActiveRecord::Schema.define(version: 20_220_530_064_811) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.integer 'record_id', null: false
    t.integer 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.integer 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'bookmarks', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.string 'source_type'
    t.integer 'source_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[source_type source_id], name: 'index_bookmarks_on_source'
    t.index ['user_id'], name: 'index_bookmarks_on_user_id'
  end

  create_table 'conversation_users', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'conversation_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['conversation_id'], name: 'index_conversation_users_on_conversation_id'
    t.index ['user_id'], name: 'index_conversation_users_on_user_id'
  end

  create_table 'conversations', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'topic'
    t.boolean 'private', default: true
  end

  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'likeable_type'
    t.integer 'likeable_id'
    t.index %w[likeable_type likeable_id], name: 'index_likes_on_likeable'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.text 'content'
    t.integer 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'conversation_id'
    t.boolean 'read', default: false
    t.index ['conversation_id'], name: 'index_messages_on_conversation_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'notifications', force: :cascade do |t|
    t.string 'source_type'
    t.integer 'source_id'
    t.boolean 'read', default: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'sender_id'
    t.integer 'recipient_id'
    t.index ['recipient_id'], name: 'index_notifications_on_recipient_id'
    t.index ['sender_id'], name: 'index_notifications_on_sender_id'
    t.index %w[source_type source_id], name: 'index_notifications_on_source'
  end

  create_table 'relations', force: :cascade do |t|
    t.integer 'follower_id'
    t.integer 'followee_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'replies', force: :cascade do |t|
    t.text 'content'
    t.integer 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'replyable_type'
    t.integer 'replyable_id'
    t.index %w[replyable_type replyable_id], name: 'index_replies_on_replyable'
    t.index ['user_id'], name: 'index_replies_on_user_id'
  end

  create_table 'retweets', force: :cascade do |t|
    t.text 'content'
    t.integer 'user_id', null: false
    t.string 'retweetable_type'
    t.integer 'retweetable_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[retweetable_type retweetable_id], name: 'index_retweets_on_retweetable'
    t.index ['user_id'], name: 'index_retweets_on_user_id'
  end

  create_table 'tweets', force: :cascade do |t|
    t.text 'content'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'user_id'
    t.string 'source_type'
    t.integer 'source_id'
    t.index %w[source_type source_id], name: 'index_tweets_on_source'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name'
    t.string 'username'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'bookmarks', 'users'
  add_foreign_key 'conversation_users', 'conversations'
  add_foreign_key 'conversation_users', 'users'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'messages', 'conversations'
  add_foreign_key 'messages', 'users'
  add_foreign_key 'notifications', 'users', column: 'recipient_id'
  add_foreign_key 'notifications', 'users', column: 'sender_id'
  add_foreign_key 'replies', 'users'
  add_foreign_key 'retweets', 'users'
end

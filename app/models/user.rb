# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :followers, foreign_key: :followee_id, class_name: 'Relation', dependent: :destroy
  has_many :followees, foreign_key: :follower_id, class_name: 'Relation', dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :retweets, as: :source, dependent: :destroy, class_name: 'Tweet'
  has_many :bookmarks, dependent: :destroy
  has_many :likes
  has_many :messages
  has_many :conversation_users
  has_many :conversations, through: :conversation_users
  has_many :notifications, foreign_key: :recipient_id, class_name: 'Notification'

  has_one_attached :avatar

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
end

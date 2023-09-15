# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :source, polymorphic: true, optional: true

  has_many :replies, as: :replyable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :bookmarks, as: :source, dependent: :destroy
  has_many :retweets, as: :source, dependent: :destroy, class_name: 'Tweet'
  has_many :notifications, as: :source

  validates :content, presence: true, if: :original_tweet?
  validates :content, length: { maximum: 280 }, if: :original_tweet?

  def original_tweet?
    source.nil?
  end
end

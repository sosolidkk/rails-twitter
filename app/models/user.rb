# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id,
                           dependent: :destroy,
                           inverse_of: :recipient

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable
  acts_as_voter

  scope :all_except, ->(user) { where.not(id: user) }

  def tweet_author?(tweet)
    tweets.exists?(id: tweet.id)
  end

  def comment_author?(comment)
    comments.exists?(id: comment.id)
  end
end

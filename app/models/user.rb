class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  acts_as_voter

  scope :all_except, ->(user) { where.not(id: user) }

  def tweet_author?(tweet)
    self.tweets.where(id: tweet.id).exists?
  end

  def comment_author?(comment)
    self.comments.where(id: comment.id).exists?
  end
end

class User < ApplicationRecord
  has_many :tweets, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  acts_as_voter

  def author?(tweet)
    self.tweets.where(id: tweet.id).exists?
  end
end

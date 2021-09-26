class Tweet < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  acts_as_votable
  validates :body, presence: true
end

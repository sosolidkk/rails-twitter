# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :body, presence: true
end

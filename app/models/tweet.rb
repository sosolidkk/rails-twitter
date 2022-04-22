# frozen_string_literal: true

class Tweet < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  belongs_to :user

  acts_as_votable
  validates :body, presence: true
end

# frozen_string_literal: true

FactoryBot.define do
  factory :comment, class: 'Comment' do
    body { 'Tweet content goes here' }
    tweet
    user
  end
end

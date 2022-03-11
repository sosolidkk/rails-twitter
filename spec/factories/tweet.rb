# frozen_string_literal: true

FactoryBot.define do
  factory :tweet, class: 'Tweet' do
    body { 'Tweet content goes here' }
    user
  end
end

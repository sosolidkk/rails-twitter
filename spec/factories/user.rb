# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    email { 'test@gmail.com' }
    password { 'mypass' }
    username { 'test' }
    bio { 'test user bio' }
    fake_username { 'test_fake' }
  end
end

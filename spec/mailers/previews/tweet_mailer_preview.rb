# frozen_string_literal: true

require 'factory_bot_rails'

class TweetMailerPreview < ActionMailer::Preview
  # Preview all emails at http://localhost:3000/rails/mailers/tweet_creation_mailer
  include FactoryBot::Syntax::Methods

  def new_tweet_email
    TweetMailer.with(user: User.first).new_tweet_email
  end
end

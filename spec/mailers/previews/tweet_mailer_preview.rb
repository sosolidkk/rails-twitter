# frozen_string_literal: true

class TweetMailerPreview < ActionMailer::Preview
  # Preview all emails at http://localhost:3000/rails/mailers/tweet_mailer

  def new_tweet_email
    TweetMailer.with(user: User.first).new_tweet_email
  end
end

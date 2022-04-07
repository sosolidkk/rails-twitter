# frozen_string_literal: true

class TweetMailer < ApplicationMailer
  def new_tweet_email
    @user = params[:user]
    @tweet = @user.tweets.last

    User.all_except(@user).each do |user|
      mail(to: user.email, subject: 'You got a new post on fish!')
    end
  end
end

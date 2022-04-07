# frozen_string_literal: true

class TweetMailer < ApplicationMailer
  def new_tweet_email
    @user = params[:user]
    @tweet = @user.tweets.last
    @recipients = User.all_except(@user).pluck(:email).join(',')

    mail(to: @recipients, subject: 'You got a new post on fish!')
  end
end

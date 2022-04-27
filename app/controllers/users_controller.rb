# frozen_string_literal: true

class UsersController < ApplicationController
  def profile
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @tweets_count = @user.tweets.count
    @tweets = @user.tweets
  end

  def ping_user
    TweetMailer.with(user: current_user).new_tweet_email.deliver
    redirect_to root_url, notice: 'Users were successfully pinged.'
  end
end

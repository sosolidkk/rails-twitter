# frozen_string_literal: true

class UsersController < ApplicationController
  def profile
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @tweets_count = @user.tweets.count
    @tweets = @user.tweets
  end
end

class UsersController < ApplicationController
  def profile
    @user_id = params[:user_id]
    @user_info = User.find(@user_id)
    @user_count = @user_info.tweets
    @tweets = Tweet.all
  end
end

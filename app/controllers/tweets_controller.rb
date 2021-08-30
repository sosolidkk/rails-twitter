class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:destroy, :like, :dislike]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save
      redirect_to '/tweets#index'
    else
      render 'new'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to '/', :notice => 'Your tweet has been deleted'
  end

  def like
    @tweet.liked_by current_user
    redirect_to '/'
  end

  def dislike
    @tweet.disliked_by current_user
    redirect_to '/'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end

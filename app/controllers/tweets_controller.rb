class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update, :destroy, :like, :dislike]

  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to root_url, notice: 'Tweet was succesfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_url, :notice => 'Your tweet has been deleted.'
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
    params.require(:tweet).permit(:body, :image)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end

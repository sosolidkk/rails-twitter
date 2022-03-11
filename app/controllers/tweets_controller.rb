# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: %i[show edit update destroy like dislike]

  def index
    @tweets = Tweet.order(created_at: :desc)
                   .paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save
      Notification.create_notifications(current_user, @tweet)
      redirect_to root_url, notice: 'Tweet was successfully created.'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to root_url, notice: 'Tweet was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_url, notice: 'Your tweet has been successfully deleted.'
  end

  def like
    @tweet.liked_by current_user
    redirect_back fallback_location: root_path
  end

  def dislike
    @tweet.disliked_by current_user
    redirect_back fallback_location: root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :image)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end

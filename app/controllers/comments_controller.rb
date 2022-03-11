# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  before_action :set_tweet, only: %i[create destroy]

  def create
    @comment = @tweet.comments.new(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      Notification.create_notifications(current_user, @comment)
      redirect_to @tweet, notice: 'Comment was successfully created.'
    else
      redirect_to @tweet, alert: 'There was a problem with the creation of your comment.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @tweet, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :tweet_id)
  end
end

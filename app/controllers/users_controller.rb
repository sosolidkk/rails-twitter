class UsersController < ApplicationController
  def profile
    @user_id = params[:user_id]
    @user_info = User.find(@user_id)
    @user_count = @user_info.tweets
    @tweets = Tweet.all
  end

  before_filter :configure_permitted_params
  protected

  def configure_permitted_params
    devise_parameter_sanitizer.for(:sign_up) do |p|
      p.permit(:name, :heard_how, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |p|
      p.permit(:name, :email, :password, :password_confirmation, :current_password)
    end
  end
end

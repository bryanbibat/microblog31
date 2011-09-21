class PagesController < ApplicationController
  def main
    if user_signed_in?
      @tweets = current_user.tweets.includes(:user).order("created_at DESC").page(params[:page])
      @tweet = Tweet.new
    else
      @tweets = Tweet.includes(:user)
      render "not_logged_in"
    end
  end

end

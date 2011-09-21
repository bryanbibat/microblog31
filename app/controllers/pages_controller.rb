class PagesController < ApplicationController
  def main
    if user_signed_in?
      @tweets = current_user.tweet_newsfeed.page(params[:page])
      @tweet = Tweet.new
    else
      @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page])
      render "not_logged_in"
    end
  end

end

class TweetsController < ApplicationController
  def global
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def create
    @tweet = current_user.tweets.build(params[:tweet])
    if @tweet.save
      redirect_to root_path, notice: "Tweet successfully created"
    else
      render "pages/main"
    end
  end
end

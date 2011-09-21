class PeopleController < ApplicationController
  before_filter :load_person, except: :index

  def index
    @people = User.order("username").page(params[:page])
  end

  def show
    @tweets = @person.tweets.page(params[:page])
  end

  def follow
    if current_user.following.exists? @person
      redirect_to person_path(@person.username), alert: "You are already following this person"
    else
      current_user.following << @person
      current_user.save
      redirect_to person_path(@person.username), notice: "Follow successful"
    end
  end

  def unfollow
    unless current_user.following.exists? @person
      redirect_to person_path(@person.username), alert: "You are not following this person"
    else
      current_user.following.delete @person
      current_user.save
      redirect_to person_path(@person.username), notice: "Unfollow successful"
    end
  end

  private

  def load_person
    @person = User.find_by_username(params[:id])
    if @person.nil?
      redirect_to people_path, alert: "Person not found"
    end
  end

end

class RatingsController < ApplicationController
  def home
  end

  def new
    @film = Film.find params[:film_id]
    @rating = Rating.new

  end

  def create
    film_id = params[:film_id]
    rating = Rating.create rating_params
    redirect_to film_path(params[:film_id])
    # redirect_to search_path
  end


  private
  def rating_params
    params.permit(:film_id, :stars, :review, :user_id)

  end
end

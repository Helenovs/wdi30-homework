#require 'httparty'

class FilmsController < ApplicationController
  before_action :check_for_admin, :only => [:edit, :update]

  #include HTTParty

  # API_KEY = "24d863d54c86392e6e1df55b9a328755"
  $API_KEY = "24d863d54c86392e6e1df55b9a328755"
  $API_BASE_URL = "https://api.themoviedb.org/3"

  def search_form
    url = "#{$API_BASE_URL}/discover/movie?api_key=#{$API_KEY}&sort_by=popularity.desc"
    @info = HTTParty.get url
    url1 = "#{$API_BASE_URL}/discover/movie?api_key=#{$API_KEY}&primary_release_year=2010&sort_by=vote_average.desc"
    @bestmovie = HTTParty.get url1
    url2 = "#{$API_BASE_URL}/discover/movie?api_key=#{$API_KEY}&with_genres=18&primary_release_year=2018"
    @bestdrama = HTTParty.get url2
    url3 = "#{$API_BASE_URL}/discover/movie?api_key=#{$API_KEY}&certification_country=US&certification.lte=G&sort_by=popularity.desc"
    @bestkidsmovie = HTTParty.get url3
  end

  def search_results
   @query = params[:query]
   url = "#{$API_BASE_URL}/search/movie?api_key=#{$API_KEY}&query=#{@query}"
   response = HTTParty.get(url)
   @results = response['results']
  end

   def show_search
     url = "#{$API_BASE_URL}/movie/#{params[:id]}?api_key=#{$API_KEY}"
     @movie = HTTParty.get(url)
     # @film = Film.create :title => @movie['original_title'], :image => "https://image.tmdb.org/t/p/w500/#{@movie['poster_path']}", :release_date => @movie["release_date"], :rating => @movie["vote_average"], :plot => @movie["overview"]

     @film=Film.find_or_create_by(title:  @movie['original_title']) do |film|
       film.image = "https://image.tmdb.org/t/p/w500/#{@movie['poster_path']}"
       film.release_date = @movie["release_date"]
       film.rating = @movie["vote_average"]
       film.plot = @movie["overview"]
     end
     redirect_to @film
   end

   # def show_discover
   #   url = "#{API_BASE_URL}/discover/movie?api_key=#{API_KEY}&sort_by=popularity.desc"
   #   @info = HTTParty.get url
   #   url1 = "#{API_BASE_URL}/discover/movie?api_key=#{API_KEY}&primary_release_year=2010&sort_by=vote_average.desc"
   #   @bestmovie = HTTParty.get url1
   #   url2 = "#{API_BASE_URL}/discover/movie?api_key=#{API_KEY}&with_genres=18&primary_release_year=2018"
   #   @bestdrama = HTTParty.get url2
   #   url3 = "#{API_BASE_URL}/discover/movie?api_key=#{API_KEY}&certification_country=US&certification.lte=G&sort_by=popularity.desc"
   #   @bestkidsmovie = HTTParty.get url3
   # end



  def index
    @films = Film.all
    @genres = Genre.all
  end

  def show
    @film = Film.find params[:id]
    # @rating = Rating.create({review:params[:review], stars:params[:stars]})
    # raise 'hell'
  end

  def new
    @film = Film.new
  end

  def create
    film =Film.create film_params
    redirect_to film
  end

  def edit
    @film = Film.find params[:id]
  end

  def update
    film = Film.find params[:id]
    film.update film_params
    redirect_to film
  end

  def destroy
    film = Film.find params[:id]
    film.destroy
    redirect_to films_path
  end

  private
  def film_params
    params.require(:film).permit(:title, :genre, :country, :image, :director_id, :release_date, :director, :runtime, :plot)
  end
end

class Api::V1::MovieTopRatedController < ApplicationController

  def index
    json = MovieGateway.get_top_rated_movies

    movies = MovieSearch.new(json)
    
    render json: MovieSearchSerializer.format_movie_details(movies)
  end
end
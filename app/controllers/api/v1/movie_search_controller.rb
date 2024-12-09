class Api::V1::MovieSearchController < ApplicationController

  def index
    json = MovieGateway.get_movie_search(params[:query])

    movies = MovieSearch.new(json)
    
    render json: MovieSearchSerializer.new(movies)
  end
end
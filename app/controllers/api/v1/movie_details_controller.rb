class Api::V1::MovieDetailsController < ApplicationController

  def show
    json = MovieGateway.get_movie_details(params[:id])
    
    movie = Movie.new(json)

    render json: MovieDetailsSerializer.new(movie)
  end
end
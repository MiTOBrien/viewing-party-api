class MovieSearchSerializer
  include JSONAPI::Serializer
  attributes :title, :vote_average

  def self.format_movie_details(movie)
    { data:
        {
          id: movie.id,
          type: "movie",
          attributes: {
            title: movie.title,
            vote_average: movie.vote_average,
          }
        }
    }
  end
end
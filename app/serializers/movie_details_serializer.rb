class MovieDetailsSerializer
  include JSONAPI::Serializer
  attributes :title, :release_year, :vote_average, :runtime, :genres, :summary, :total_reviews

  def self.format_movie_details(movie)
    { data:
        {
          id: movie.id,
          type: "movie",
          attributes: {
            title: movie.title,
            release_year: movie.release_year,
            vote_average: movie.vote_average,
            runtime: movie.runtime,
            genres: movie.genres,
            summary: movie.summary,
            total_reviews: movie.total_reviews
          }
        }
    }
  end
end
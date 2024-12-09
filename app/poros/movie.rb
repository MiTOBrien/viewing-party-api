class Movie
  attr_reader :id,
              :title,
              :release_year,
              :vote_average,
              :runtime,
              :genres,
              :summary,
              :total_reviews

  def initialize(movie_json)
    # movie = movie_json[:results][0]
    movie = movie_json
    date = movie_json[:release_date]
    year = date.split("-").first
    genres = movie[:genres]
    genres = genres.map { |genre| genre[:name] }

    @id = movie[:id]
    @title = movie[:title]
    @release_year = year
    @vote_average = movie[:vote_average]
    @runtime = movie[:runtime]
    @genres = genres
    @summary = movie[:overview]
    @total_reviews = movie[:vote_count]
  end
end
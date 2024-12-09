class MovieSearch
  attr_reader :id,
              :title,
              :vote_average

  def initialize(movie_json)
    movies = movie_json
    movies.map { |movie| 
      @id = movie[:id]
      @title = movie[:title]
      @vote_average = movie[:vote_average]
    }
  end
end
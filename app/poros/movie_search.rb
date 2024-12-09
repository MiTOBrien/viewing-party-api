class MovieSearch
  attr_reader :id,
              :title,
              :vote_average

  def initialize(movie_json)
    # movie = movie_json[:results][0]
    movies = movie_json
    movies.map { |movie| 
      @id = movie[:id]
      @title = movie[:title]
      @vote_average = movie[:vote_average]
    }
  end
end
class MovieGateway
  def self.conn
      conn = Faraday.new(
        url: "https://api.themoviedb.org",
        headers: {Authorization: Rails.application.credentials.tmdb[:key]}
        )
  end

  def self.get_movie_details(movie)
    movie = movie.to_i
    response = conn.get("/3/movie/#{movie}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_movie_search(query)
    response = conn.get("/3/search/movie", {query: query})
    json = JSON.parse(response.body, symbolize_names: true)
    top_20 = json[:results].take(20)
  end

  def self.get_top_rated_movies
    response = conn.get("/3/movie/top_rated")
    json = JSON.parse(response.body, symbolize_names: true)
    top_rated = json[:results].take(20)
  end
end
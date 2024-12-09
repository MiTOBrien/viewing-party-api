require "rails_helper"

RSpec.describe "Movie Search API", type: :request do
  describe "search movies" do
    it 'Can search movies' do
      get "/api/v1/movie_search?query=lord of the rings"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to have_key(:id)
      expect(json[:data][:type]).to eq("movie_search")
      expect(json[:data][:attributes]).to have_key(:title)
      expect(json[:data][:attributes]).to have_key(:vote_average)
    end

  end
end
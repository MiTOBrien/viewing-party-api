require "rails_helper"

RSpec.describe "Top Rated Movies API", type: :request do
  describe "get top rated movies" do
    it 'Can get top rated movies' do
      get "/api/v1/movie_top_rated"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to have_key(:id)
      expect(json[:data][:type]).to eq("movie_search")
      expect(json[:data][:attributes]).to have_key(:title)
      expect(json[:data][:attributes]).to have_key(:vote_average)
    end

  end
end
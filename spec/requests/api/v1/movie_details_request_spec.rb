require "rails_helper"

RSpec.describe "Movie Details API", type: :request do
  describe "Gets Movie Detailss" do
    it 'Can get movie details' do
      get "/api/v1/movie_details/348"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:id]).to eq("348")
      expect(json[:data][:type]).to eq("movie_details")
      expect(json[:data][:attributes][:title]).to eq("Alien")
      expect(json[:data][:attributes][:release_year]).to eq("1979")
      expect(json[:data][:attributes][:vote_average]).to eq(8.2)
      expect(json[:data][:attributes][:runtime]).to eq(117)
      expect(json[:data][:attributes][:genres]).to eq(["Horror", "Science Fiction"])
      expect(json[:data][:attributes][:summary]).to eq("During its return to the earth, commercial spaceship Nostromo intercepts a distress signal from a distant planet. When a three-member team of the crew discovers a chamber containing thousands of eggs on the planet, a creature inside one of the eggs attacks an explorer. The entire crew is unaware of the impending nightmare set to descend upon them when the alien parasite planted inside its unfortunate host is birthed.")
      expect(json[:data][:attributes][:total_reviews]).to eq(14770)
    end

  end
end
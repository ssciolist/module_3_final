require 'rails_helper'

describe 'As a user' do
  describe 'when I send a GET request to /api/v1/games/1' do
    it 'sends a JSON response with game id and scores' do
      require 'pry'; binding.pry
      user1 = User.create!(name: 'Josh')
      user2 = User.create!(name: 'Sal')
      game = Game.create!(player_1_id: user1.id, player_2_id: user2.id)
      Play.create!(user_id: 1, game_id: 1, word: "zoo")
      Play.create!(user_id: 2, game_id: 1, word: "boo")
      get '/api/v1/game/1'

      expect(response).to be_successful


      result = JSON.parse(response.body)

      expect(result['game_id']).to eq(1)
      expect(result['scores'][0]['user_id']).to eq(1)
      expect(result['scores'][0]['score']).to eq(13)
      expect(result['scores'][1]['user_id']).to eq(2)
      expect(result['scores'][1]['score']).to eq(5)
    end
  end
end

# When I send a GET request to "/api/v1/games/1" I receive a JSON response as follows:
#
# {
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":15
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }

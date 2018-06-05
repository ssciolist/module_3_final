require 'rails_helper'

describe 'As a user' do
  describe 'when I send a POST request with a valid word to /api/v1/games/1/plays' do
    it 'sends a 201, then I can see that play in my game' do
      VCR.use_cassette('user_posts_valid_request') do
        user1 = User.create!(name: 'Josh')
        user2 = User.create!(name: 'Sal')
        game = Game.create!(player_1_id: user1.id, player_2_id: user2.id)
        Play.create!(user_id: user1.id, game_id: game.id, word: "zoo")
        Play.create!(user_id: user2.id, game_id: game.id, word: "boo")

        post_params = {user_id: user1.id, word: 'at'}
        post "/api/v1/games/#{game.id}/plays", params: post_params

        expect(response.status).to eq(201)

        get "/api/v1/game/#{game.id}"

        result = JSON.parse(response.body)
        expect(result['game_id']).to eq(game.id)
        expect(result['scores'][0]['user_id']).to eq(user1.id)
        expect(result['scores'][0]['score']).to eq(14)
        expect(result['scores'][1]['user_id']).to eq(user2.id)
        expect(result['scores'][1]['score']).to eq(5)
      end
    end
  end

  describe 'when I send a POST request with a invalid word to /api/v1/games/1/plays' do
    it 'sends a 201, with a message that my word was not valid' do
      VCR.use_cassette('user_posts_invalid_request') do
        user1 = User.create!(name: 'Josh')
        user2 = User.create!(name: 'Sal')
        game = Game.create!(player_1_id: user1.id, player_2_id: user2.id)

        post_params = {user_id: user1.id, word: 'foxez'}
        post "/api/v1/games/#{game.id}/plays", params: post_params

        result = JSON.parse(response.body)
        expect(result['message']).to eq('foxez is not a valid word')
      end
    end
  end
end

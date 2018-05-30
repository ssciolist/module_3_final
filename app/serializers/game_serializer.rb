class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end

  def scores
    [
      {
        "user_id": object.player_1.id,
        "score": player_score(object.player_1.id)
      },
      {
        "user_id": object.player_2.id,
        "score": player_score(object.player_2.id)
      }
    ]
  end

  def player_score(id)
    plays = object.plays.select do |play|
      play.user_id == id
    end

    plays.sum { |play| play.score }
  end
end

class Api::V1::Games::PlaysController < ApplicationController
  def create
    play = Play.new(user_id: params[:user_id], game_id: params[:id], word: params[:word])
      if WordSearchService.new(play.word).request_status == 200
        play.save
        render json: {message: 'success'}, status: 201
      elsif WordSearchService.new(play.word).request_status == 404
        render json: {message: "#{play.word} is not a valid word"}
      end
  end
end

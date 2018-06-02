class Api::V1::Games::PlaysController < ApplicationController
  def create
    word = Word.new(params[:word])
    play = Play.new(user_id: params[:user_id], game_id: params[:id], word: params[:word])
      if word.valid?
        play.save
        render json: {message: 'success'}, status: 201
      else
        render json: {message: "#{play.word} is not a valid word"}
      end
  end
end

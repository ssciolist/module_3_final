class Api::V1::Games::PlaysController < ApplicationController
  def create
    play = Play.new(user_id: params[:user_id], game_id: params[:id], word: params[:word])
      if play.save
        render json: {message: 'success'}, status: 201
      else
        render json: {message: 'error'}, status: 500
      end
  end
end

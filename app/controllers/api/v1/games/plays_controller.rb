class Api::V1::Games::PlaysController < ApplicationController
  before_action :check_for_valid_word
  def create
    play = Play.new(user_id: params[:user_id], game_id: params[:id], word: params[:word])
      if play.save
        render json: {message: 'success'}, status: 201
      else
        render json: {message: "Hm, did you send us all the right info? Something went wrong."}
      end
  end

  private

  def check_for_valid_word
    word = Word.new(params[:word])
    unless word.valid?
      render json: {message: "#{word.input} is not a valid word"}
    end
  end
end

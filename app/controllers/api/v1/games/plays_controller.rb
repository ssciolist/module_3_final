class Api::V1::Games::PlaysController < ApplicationController
  def create
    render json: Game.find(params[:id])
  end
end

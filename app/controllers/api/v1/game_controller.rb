class Api::V1::GameController < ApplicationController
  def show
    render json: Game.find(params[:id])
  end
end

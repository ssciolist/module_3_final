class Api::V1::GameController < ApplicationController
  def show
    render json: current_user
  end
end

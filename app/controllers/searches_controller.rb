class SearchesController < ApplicationController
  def index
    @word = Word.new(params[:text])
    if @word.valid?
      render :valid
    else
      render :invalid
    end
  end
end

class WelcomeController < ApplicationController

  def index
    if params[:text]
      @word = Word.new(params[:text])
      if @word.valid?
        render :valid
      else
        render :invalid
      end
    end
  end
end

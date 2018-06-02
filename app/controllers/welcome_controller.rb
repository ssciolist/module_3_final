class WelcomeController < ApplicationController
  attr_reader :headers

  def index

    if params[:text]
      @word = params[:text]
      search = WordSearchService.new(params[:text])
      if search.request_status == 200
        @root_word = search.root_word
        render :valid
      else
        render :invalid
      end

    end
  end

end

class WelcomeController < ApplicationController
  attr_reader :headers

  def index

    if params[:text]
      search

      if search.is_a?(String)
        render :valid
      else
        render :invalid
      end
    else
    end

  end

  def search
    conn = Faraday.new(:url => "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{params[:text]}")
    with_auth = conn.get do |req|
      req.headers["Accept"] = "application/json"
      req.headers["app_id"] = ENV['OXFORD_APP_ID']
      req.headers["app_key"] = ENV['OXFORD_APP_KEY']
    end

      begin
        JSON.parse(with_auth.body, symbolize_names: true)
        raw_result = JSON.parse(with_auth.body, symbolize_names: true)
        root_word = raw_result[:results][0][:lexicalEntries][1][:inflectionOf][0][:text]
        valid_word =  JSON.parse(with_auth.body, symbolize_names: true)[:results][0][:word]
      rescue JSON::ParserError
      end
  end

  def headers
    {
      "Accept": "application/json",
      "app_id": ENV['OXFORD_APP_ID'],
      "app_key": ENV['OXFORD_APP_KEY']
    }
  end
end

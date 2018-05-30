class WelcomeController < ApplicationController
  attr_reader :headers

  def index
    conn = Faraday.new(:url => 'https://od-api.oxforddictionaries.com/api/v1/inflections/en/foxes')
    with_auth = conn.get do |req|
      req.headers["Accept"] = "application/json"
      req.headers["app_id"] = ENV['OXFORD_APP_ID']
      req.headers["app_key"] = ENV['OXFORD_APP_KEY']
    end

    raw_result = JSON.parse(with_auth.body, symbolize_names: true)
    root_word = raw_result[:results][0][:lexicalEntries][1][:inflectionOf][0][:text]
    valid_word =  raw_result[:results][0][:word]

    require 'pry'; binding.pry

  end

  def headers
    {
      "Accept": "application/json",
      "app_id": ENV['OXFORD_APP_ID'],
      "app_key": ENV['OXFORD_APP_KEY']
    }
  end
end

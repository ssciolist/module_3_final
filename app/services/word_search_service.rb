class WordSearchService
  def initialize(word)
    @word = word
    @conn = Faraday.new(:url => "https://od-api.oxforddictionaries.com") do |f|
      f.adapter Faraday.default_adapter
      f.headers["Accept"] = "application/json"
      f.headers["app_id"] = ENV['OXFORD_APP_ID']
      f.headers["app_key"] = ENV['OXFORD_APP_KEY']
    end
  end

  def word_request
    @conn.get("/api/v1/inflections/en/#{@word}")
  end

  def request_status
    word_request.status
  end

  def raw_result
    JSON.parse(word_request.body, symbolize_names: true)
  end
end

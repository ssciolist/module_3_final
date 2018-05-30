class WordSearchService
  attr_reader :root_word, :valid_word, :word, :status

  def initialize(word)
    @word = word
  end

  def conn
    Faraday.new(:url => "https://od-api.oxforddictionaries.com/api/v1/inflections/en/#{@word}")
  end

  def word_request
    conn.get do |req|
      req.headers["Accept"] = "application/json"
      req.headers["app_id"] = ENV['OXFORD_APP_ID']
      req.headers["app_key"] = ENV['OXFORD_APP_KEY']
    end
  end

  def request_status
    word_request.status
  end

  def raw_result
    JSON.parse(word_request.body, symbolize_names: true)
  end

  def root_word
    raw_result[:results][0][:lexicalEntries][1][:inflectionOf][0][:text]
  end

  def valid_word
    raw_result[:results][0][:word]
  end
end
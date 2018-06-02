class Word
  attr_reader :input

  def initialize(input)
    @search = WordSearchService.new(input)
    @input = input
  end

  def valid?
    @search.request_status == 200
  end

  def root_word
    @search.raw_result[:results][0][:lexicalEntries][1][:inflectionOf][0][:text]
  end
end

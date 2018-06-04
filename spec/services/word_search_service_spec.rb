require 'rails_helper'

describe WordSearchService do
  subject { WordSearchService.new('bananas') }

  let(:bad_request) { WordSearchService.new('baddada') }

  context 'instance methods' do
    context '#request_status' do
      it 'returns 200 status code for a good request' do
        VCR.use_cassette('word_model_bananas') do
          expect(subject.request_status).to eq(200)
        end
      end

      it 'returns 404 for a bad request' do
        VCR.use_cassette('word_service_baddada') do
          expect(bad_request.request_status).to eq(404)
        end
      end
    end

    context '#raw_result' do
      it 'returns the hash with word data' do
        VCR.use_cassette('word_service_bananas') do
          first_result = subject.raw_result[:results][0]

          expect(subject.raw_result).to have_key(:results)
          expect(first_result).to have_key(:lexicalEntries)
          expect(first_result).to have_key(:word)
        end
      end
    end
  end
end

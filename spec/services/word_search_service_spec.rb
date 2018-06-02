require 'rails_helper'

describe WordSearchService do
  subject { WordSearchService.new('bananas') }

  let(:bad_request) { WordSearchService.new('baddada') }

  context 'instance methods' do
    context '#request_status' do
      it 'returns the status code of the request' do
        expect(subject.request_status).to eq(200)

        expect(bad_request.request_status).to eq(404)
      end
    end

    context '#raw_result' do
      it 'returns the hash with word data' do
        first_result = subject.raw_result[:results][0]

        expect(subject.raw_result).to have_key(:results)
        expect(first_result).to have_key(:lexicalEntries)
        expect(first_result).to have_key(:word)
      end
    end

    context '#root_word' do
      it 'returns the root word' do
        expect(subject.root_word).to eq('banana')
      end
    end

    context '#valid_word' do
      it 'returns the valid word' do
        expect(subject.valid_word).to eq('bananas')
      end
    end
  end
end

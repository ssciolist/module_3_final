require 'rails_helper'

describe Word do

  subject { Word.new('bananas') }

  it 'exists' do
    expect(subject).to be_a Word
  end

  context 'instance methods' do
    context '#valid?' do
      it 'returns a boolean based on service call' do
        VCR.use_cassette('word_model_bananas') do
          expect(subject.valid?).to eq true
        end
      end
    end

    context '#root_word' do
      it 'returns the root word' do
        VCR.use_cassette('word_model_bananas') do
          expect(subject.root_word).to eq 'banana'
        end
      end
    end
  end
end

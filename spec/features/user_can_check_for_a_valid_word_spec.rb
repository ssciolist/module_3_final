require 'rails_helper'

describe 'As a guest user' do
  describe 'when I visit /' do
    describe 'and I fill in a text box with a valid word' do
      it 'tells me if the word is valid' do
        visit '/'

        fill_in 'text', with: 'foxes'
        click_on 'Validate Word'

        expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
      end
    end

    describe 'and I fill in a text box with an invalid word' do
      it 'tells me the word is invalid' do
        visit '/'

        fill_in 'text', with: 'foxez'
        click_on 'Validate Word'

        expect(page).to have_content("'foxez' is a not a valid word.")
      end
    end
  end
end

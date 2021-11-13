require 'rails_helper'

describe 'Index page', type: :feature do
    it 'should render correctly' do
        @alan = FactoryBot.create :author
        visit authors_url
        expect(page).to have_text 'Name'
        expect(page).to have_text 'Homepage'
        expect(page).to have_text "Alan Turing"
        expect(page).to have_text "http://wikipedia.org/Alan_Turing"
        expect(page).to have_link 'New', href: new_author_path
    end
end
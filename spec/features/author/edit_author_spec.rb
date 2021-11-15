require 'rails_helper'

describe 'Edit author page', type: :feature do
    it 'should update attributes of an author and no error should occur' do
        @author = FactoryBot.create :author
        visit edit_author_path(@author)
        page.fill_in 'author[first_name]', with: "Peter"
        find('input[type="submit"]').click
        @author.reload
        expect(@author.first_name).to eq("Peter")
    end

end
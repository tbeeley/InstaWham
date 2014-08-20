require 'rails_helper'

describe 'tagging posts' do
	it 'displays tags as links under posts' do
		visit '/posts'
      click_link('Add new post')
      fill_in 'post_title', with: 'A brand new post'
      fill_in 'Tags', with: '#WW1, #Paris'
      click_button('Create post')

      expect(page).to have_link '#WW1'
      expect(page).to have_link '#Paris'
	end
end
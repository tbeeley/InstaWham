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

describe 'filtering by tags' do

	before do
		Post.create(title: 'Children in Nam', tag_list: '#Nam, #Youth')
		Post.create(title: 'Children in Nam B', tag_list: '#Nam, #Littleuns')
	end

	it 'filters to show only tagged posts' do
		visit '/posts'
		click_link '#Youth'

		expect(page).to have_css 'h1', text: 'Posts tagged with #Youth'
		expect(page).not_to have_content 'Children in Nam B'
		expect(page).to have_content 'Children in Nam'
	end

	it 'accessible via pretty URLs' do
		visit '/tags/Youth'
		expect(page).to have_content 'Children in Nam'
	end

end

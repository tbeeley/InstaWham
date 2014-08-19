require 'rails_helper'

describe 'posts' do
  context 'no posts' do

    it 'should let the user know there are no posts' do
      visit '/posts'
      expect(page).to have_content('There are currently no posts')
    end

  end

  context 'with posts' do

    before do
      Post.create(title: "Charlie don't surf")
    end

    it 'should list the posts' do
      visit '/posts'
      expect(page).to have_content("Charlie don't surf")
    end

  end

  describe 'creating posts' do

    it 'adds the posts to a form' do
      visit '/posts'
      click_link('Add new post')
      fill_in 'post_title', with: 'A brand new post'
      click_button('Create post')

      expect(page).to have_content('A brand new post')
      expect(current_path).to eq '/posts'
    end

    it 'can attach an image to a post' do
      visit('/posts')
      click_link('Add new post')
      fill_in 'post_title', with: 'A brand new post'
      attach_file 'Picture', Rails.root.join('spec/images/children.png')
      click_button 'Create post'

      expect(page).to have_content('A brand new post')
      expect(page).to have_css 'img.uploaded-pic'
    end


  end

end

require 'rails_helper'

describe 'navegate' do
  describe 'index' do
    it 'Post page Avalaible' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'Post has content' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end
  
  describe 'Post Creation' do
    it 'Can Access New Page' do
      visit new_post_path
      expect(page.status_code).to eq(200)
    end

    it 'Can create a new post' do
      visit new_post_path
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "Save"
      expect(page).to have_content("rationale")
    end
  end
end
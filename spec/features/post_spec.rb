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
end
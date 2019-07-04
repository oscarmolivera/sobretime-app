require 'rails_helper'

describe 'navegate' do
  before do
    user = User.create!(email: "asde@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name:"Snow")
    login_as(user, scope: :user)
  end
  
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
    before do
      visit new_post_path
    end
    
    it 'Can Access New Page' do
      expect(page.status_code).to eq(200)
    end

    it 'Can create a new post' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Some rationale"

      click_on "Save"
      expect(page).to have_content("rationale")
    end
     it 'will be associated with an user' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Rationale"

      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Rationale")
     end
  end
end
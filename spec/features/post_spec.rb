require 'rails_helper'

describe 'navegate' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
    visit posts_path
  end
  
  describe 'index' do
    it 'can be access' do
      expect(page.status_code).to eq(200)
    end

    it 'has a \'post\' title' do
      expect(page).to have_content(/Posts/)
    end

    it 'has some Posts with content' do
      post1 = FactoryBot.create(:post)
      post2 = FactoryBot.create(:second_post)
      visit posts_path
      expect(page).to have_content(/Some|rationale/)
    end

    it 'has a user with a Last and First Name' do
      expect(@user.full_name).to eq("Snow, Jon")
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
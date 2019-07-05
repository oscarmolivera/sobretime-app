require 'rails_helper'

describe 'navegate' do
  before do
    @user = User.create!(email: "asde@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name:"Snow")
    login_as(@user, scope: :user)
    visit posts_path
  end
  
  describe 'index' do
    it 'can be access' do
      expect(page.status_code).to eq(200)
    end

    it 'has a post title' do
      expect(page).to have_content(/Posts/)
    end

    it 'has some Posts with content' do
      post1 = Post.create!(date: Date.today, rationale: 'This is post1', user_id: @user.id)
      post2 = Post.create!(date: Date.today, rationale: 'This is post2', user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/post1|post2/)
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
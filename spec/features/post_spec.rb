require 'rails_helper'

describe 'navegate' do
  before do
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
    visit posts_path
  end
  
  describe 'to index' do
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
  
  describe 'new' do
    it 'y tiene un enlace para crear POST' do
      visit root_path
      
      click_link("new_post_from_nav")
      visit new_post_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'to creation' do
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

  describe 'to edit' do
    before do
      @post = FactoryBot.create(:post)
    end
    it 'y puede accederse desde enlace en Post_Path' do
      visit posts_path
      click_link("edit#{@post.id}")
      visit edit_post_path(@post)
      expect(page.status_code).to eq(200)
    end

    it 'y se puede editar y guardar en la BD' do
      visit edit_post_path(@post)
      fill_in 'post[date]',	with: Date.today
      fill_in 'post[rationale]', with: "Content Edited"

      click_on 'Save'
      expect(page).to have_content("Content Edited")
    end
  end
end
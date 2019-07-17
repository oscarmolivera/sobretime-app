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
      post1.update(user_id: @user.id)
      post2.update(user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/Some|rationale/)
    end

    it 'tiene solo la lista de POST creados por el usuario' do
      post1 =  Post.create!(date: Date.today, rationale:"Test rationale Numero Uno!", user_id: @user.id)
      post2 =  Post.create!(date: Date.today, rationale:"Test rationale Numero Uno!", user_id: @user.id)
      other_user = User.create!(email: "user@test.com", first_name: "Test", last_name: "User", password: "123456", password_confirmation: "123456")
      other_user_post =  Post.create!(date: Date.today, rationale:"Test rationale Numero DOS!", user_id: other_user.id)
      #byebug
      visit posts_path
      expect(page).to_not have_content(/Test rationale Numero DOS!/)
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

  describe 'delete' do
     it 'y existe un enlace para borrar Post' do
      post = FactoryBot.create(:post)
      post.update(user_id: @user.id)
      visit posts_path
      click_link("delete#{post.id}")
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
      @edit_user = User.create(email: "user_edit@gmail.com", first_name: "User", last_name: "Edit", password: "123456", password_confirmation: "123456")
      login_as(@edit_user, scope: :user)
      @edit_post = Post.create!(date: Date.today, rationale:"Test Editind Post", user_id: @edit_user.id)
    end

    it 'y se puede editar y guardar en la BD' do
      visit edit_post_path(@edit_post)
      fill_in 'post[date]',	with: Date.today
      fill_in 'post[rationale]', with: "Content Edited"

      click_on 'Save'
      expect(page).to have_content("Content Edited")
    end

    it 'no puede ser editada por un usuario no authorizado' do
      logout(:user)
      non_authorized_user = FactoryBot.create(:non_authorized_user)
      login_as(non_authorized_user, scope: :user)
      visit edit_post_path(@edit_post)
      expect(current_path).to eq(root_path)
    end
  end
end
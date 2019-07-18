require 'rails_helper'

describe 'navegate' do
  let(:user) {FactoryBot.create(:user)}
  let!(:post1) do
    Post.create(date: Date.today, rationale:"Some test rationale Numero Uno!", user_id: user.id, overtime_request: 1.3)
  end
  before do
    login_as(user, scope: :user)
  end
  
  describe 'to index' do
    before do
      visit posts_path
    end

    it 'can be access' do
      expect(page.status_code).to eq(200)
    end

    it 'has a \'post\' title' do
      expect(page).to have_content(/Posts/)
    end

    it 'has some Posts with content' do
      expect(page).to have_content(/Some|rationale/)
    end

    it 'tiene solo la lista de POST creados por el usuario' do
      other_user = User.create!(email: "user@test.com", first_name: "Test", last_name: "User", password: "123456", password_confirmation: "123456")
      other_user_post =  Post.create!(date: Date.today, rationale:"Test rationale Numero DOS!", user_id: other_user.id, overtime_request: 0.3)
      #byebug
      visit posts_path
      expect(page).to_not have_content(/Test rationale Numero DOS!/)
    end

    it 'has a user with a Last and First Name' do
      expect(user.full_name).to eq("Snow, Jon")
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
      visit posts_path
      click_link("delete#{post1.id}")
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
      fill_in 'post[overtime_request]', with: 4.5

      expect{click_on "Save"}.to change(Post, :count).by(1)
    end
     it 'will be associated with an user' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Rationale"
      fill_in 'post[overtime_request]', with: 4.5

      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Rationale")
     end
  end

  describe 'to edit' do

    it 'y se puede editar y guardar en la BD' do
      visit edit_post_path(post1)
      fill_in 'post[date]',	with: Date.today
      fill_in 'post[rationale]', with: "Content Edited"

      click_on 'Save'
      expect(page).to have_content("Content Edited")
    end

    it 'no puede ser editada por un usuario no authorizado' do
      logout(:user)
      non_authorized_user = FactoryBot.create(:other_user)
      login_as(non_authorized_user, scope: :user)
      visit edit_post_path(post1)
      expect(current_path).to eq(root_path)
    end
  end
end
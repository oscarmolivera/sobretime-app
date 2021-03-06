require 'rails_helper'

describe 'navegate' do
  let(:user) {FactoryBot.create(:user)}
  let!(:post1) do
    Post.create(date: Date.today, work_performed:"Some test Work Numero Uno!", user_id: user.id, daily_hours: 13.3)
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
      expect(page).to have_content(/Some|Work/)
    end

    it 'tiene solo la lista de POST creados por el usuario' do
      post1
      second_post = FactoryBot.create(:second_post)
      second_post.update(user_id: user.id)

      visit posts_path

      expect(page).to have_text(post1.work_performed)
      expect(page).to have_text(second_post.work_performed)
    end

    it 'has a user with a Last and First Name' do
      expect(user.full_name).to eq("Snow, Jon")
    end


  end
  
  describe 'new' do
    it 'y tiene un enlace para crear POST' do
      employee = Employee.create!(email: "employee@test.com", first_name: "Employee", last_name: "User", password: "123456", password_confirmation: "123456", phone: "555599879", ssn: '9468', company: 'TestLLC')
      login_as(employee, scope: :user)
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
      fill_in 'post[work_performed]', with: "Some Work"
      fill_in 'post[daily_hours]', with: 14.5

      expect{click_on "Save"}.to change(Post, :count).by(1)
    end
     it 'will be associated with an user' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[work_performed]', with: "User Work"
      fill_in 'post[daily_hours]', with: 4.5

      click_on "Save"
      expect(User.last.posts.last.work_performed).to eq("User Work")
     end
  end

  describe 'to edit' do

    it 'y se puede editar y guardar en la BD' do
      visit edit_post_path(post1)
      fill_in 'post[date]',	with: Date.today
      fill_in 'post[work_performed]', with: "Content Edited"

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
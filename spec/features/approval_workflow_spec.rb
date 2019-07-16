require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryBot.create(:admin_user)
    login_as(@admin_user, scope: :user)
  end

  describe 'edit' do
    before do
      @post = FactoryBot.create(:post)
    end

    it 'has a status that can be edited on the form by an Admin' do
      visit edit_post_path(@post)
      choose 'post_status_aprobado'
      click_on "Save"
      expect(@post.reload.status).to eq('aprobado')
    end

    it 'can not be edited by a non admin' do
      logout(@admin_user)
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)

      visit edit_post_path(@post)
      expect(page).to_not have_content('Aprobado')
    end
  end
end
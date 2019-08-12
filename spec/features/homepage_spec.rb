require 'rails_helper'

describe "HomePage" do
  describe "Approve" do
    it 'can be aproved by the boton in the block' do
      admin_user = FactoryBot.create(:admin_user)
      login_as(admin_user, scope:  :user)
      post = FactoryBot.create(:post)
      visit root_path
      click_on("Post##{post.id}")
      expect(post.reload.status).to eq('aprobado')
    end

    it 'can not be approved by a non admin user' do
      user = FactoryBot.create(:user)
      login_as(user, scope:  :user)
      post = FactoryBot.create(:post)
      visit approve_post_path(post)
      expect(post.reload.status).to eq('registrado')
    end

    it 'user pending confirmations can not be confirm using a button' do
      user = FactoryBot.create(:user)
      login_as(user, scope:  :user)
      audit_log = FactoryBot.create(:audit_log)
      audit_log.update(user_id: user.id)
      visit root_path
      click_on("pending_confirm##{audit_log.id}")
      visit confirm_audit_log_path(audit_log)
      expect(audit_log.reload.status).to eq('confirmado')
    end
  end  
end

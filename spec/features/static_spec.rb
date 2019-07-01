require 'rails_helper'

describe 'navegate' do
  describe 'homepage' do
    it 'Existe_home' do
      visit root_path
      expect(page.status_code).to eq(200)  
    end
  end
end
require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @user = FactoryBot.create(:user)
  		@post = FactoryBot.create(:post)
  	end

  	it 'can be created' do	
  		expect(@post).to be_valid
  	end

  	it 'cannot be created without a date and work_performed' do
  		@post.date = nil
			@post.work_performed = nil
			@post.daily_hours = nil
  		expect(@post).to_not be_valid
		end
		
		it 'the daily_hours is greater than 0' do
			@post.daily_hours = 0.0
			expect(@post).to_not be_valid
		end
  end
end
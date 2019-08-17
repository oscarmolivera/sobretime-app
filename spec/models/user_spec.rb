require 'rails_helper'

RSpec.describe User, type: :model do
	before do
			@user = User.create(email: "test@test.com", 
													password: "asdfasdf", 
													password_confirmation: "asdfasdf", 
													first_name: "Jon", 
													last_name: "Snow", 
													phone: "565559984")
  	end
  describe "creation" do

  	it "can be created" do
  		expect(@user).to be_valid
  	end
	end
	
	describe 'validations' do
		
		it "cannot be created without first_name, last_name" do
  		@user.first_name = nil
  		@user.last_name = nil
  		expect(@user).to_not be_valid
		end

		it "cannot be created without phone" do
  		@user.phone = nil
  		expect(@user).to_not be_valid
		end

		it 'can not have a phone with letters' do
			@user.phone = 'myphonenum'
			expect(@user).to_not be_valid
		end

		it 'has to be exactly 10 char long' do
			@user.phone = '12345678'
			expect(@user).to_not be_valid
		end
	end
end
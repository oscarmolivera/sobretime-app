require 'rails_helper'

RSpec.describe User, type: :model do
	before do
			@user = User.create(email: "test@test.com", 
													password: "asdfasdf", 
													password_confirmation: "asdfasdf", 
													first_name: "Jon", 
													last_name: "Snow", 
													phone: "565559984",
													ssn: '6654',
													company: 'Test LLC')
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

		it "cannot be created without a company name" do
  		@user.company = nil
  		expect(@user).to_not be_valid
		end

		it "cannot be created without a SSN value" do
  		@user.ssn = nil
  		expect(@user).to_not be_valid
		end

		it "SSN value has to have only numbers" do
  		@user.ssn = "Test number"
  		expect(@user).to_not be_valid
		end

		it 'phone number can not have letters in it' do
			@user.phone = 'myphonenum'
			expect(@user).to_not be_valid
		end

		it 'the phone number has to be exactly 9 char long' do
			@user.phone = '12345678'
			expect(@user).to_not be_valid
		end
	end

	describe 'Relaciones entre AdminUser y Employee' do
		it 'allows manager to be asociatiates with diferentes users' do
			employee_1 = FactoryBot.create(:user)
			employee_2 = FactoryBot.create(:user)
			admin_user = FactoryBot.create(:admin_user)
			Hand.create!(user_id: admin_user.id, hand_id: employee_1.id)
			Hand.create!(user_id: admin_user.id, hand_id: employee_2.id)

			expect(admin_user.hands.count).to eq(2)
		end
	end

end
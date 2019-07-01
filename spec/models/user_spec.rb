require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create!(email: 'userTest@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name:'Jon', last_name:'Snow')
  end
  
  it "user can be created" do
    expect(@user).to be_valid
  end

  it "user can NOT be created" do
    @user.first_name = nil
    @user.last_name = nil
    expect(@user).to_not be_valid
  end 
  
end

require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = Post.create(date: Date.today, rationale: 'Something')
  end
  
  describe 'Creation' do
    it "Can create a Post" do
      expect(@post).to be_valid
    end
    
    it "Can NOT create a Post" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
    
  end
end

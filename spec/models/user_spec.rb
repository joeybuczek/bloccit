require 'rails_helper'

describe User do
  
  include TestFactories
  
  before do
    @post = associated_post
    @user = authenticated_user
  end
  
  describe "#favorited(post)" do
    it "returns 'nil' if the user has not favorited the post" do
      expect( @post.favorites.where(user: @user).first ).to be_nil
    end
    
    it "returns the appropriate favorite if it exists" do
      @post.favorites.create(user: @user)
      expect( @post.favorites.where(user: @user).first ).not_to be_nil
    end
  end
end
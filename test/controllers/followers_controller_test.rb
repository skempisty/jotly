require 'test_helper'

class FollowersControllerTest < ActionController::TestCase

  #follow

  describe "the follow action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should Post new follower" do
      @request.env["HTTP_REFERER"] = '/'
      post :follow, { params: followers(:testFollow).attributes }
    end
  end

  #unfollow

  describe "the unfollow action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should Post to remove follower" do
      @request.env["HTTP_REFERER"] = '/'
      post :unfollow, { params: followers(:testFollow).attributes }
    end
  end

end

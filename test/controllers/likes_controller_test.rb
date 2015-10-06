require 'test_helper'

class LikesControllerTest < ActionController::TestCase

  #like

  describe "the like action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should POST a like" do
      @request.env["HTTP_REFERER"] = '/'
      assert_difference 'jots(:testJot).reload.likes_count', 1 do
        post :like, { id: jots(:testJot).id }
      end
    end
  end

  #unlike

  describe "the unlike action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should POST an unlike" do
      @request.env["HTTP_REFERER"] = '/'
      assert_difference 'jots(:testJot).reload.likes_count', -1 do
        post :unlike, { id: jots(:testJot).id }
      end
    end
  end

  #show

  describe "the show action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should GET show likes" do
      get :show, { id: jots(:testJot).id }
      response.success?.must_equal true
    end
  end
end

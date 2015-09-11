require 'test_helper'

class LikesControllerTest < ActionController::TestCase

  #like

  describe "the like action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should POST a like" do
      @request.env["HTTP_REFERER"] = '/'
      post :like, { id: jots(:testJot).id }
    end
  end


  #unlike

  describe "the unlike action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should POST an unlike" do
      @request.env["HTTP_REFERER"] = '/'
      post :unlike, { id: jots(:testJot).id }
    end
  end

  #show

  describe "the show action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should GET show likes" do
      get :show, { id: jots(:testJot).id }
    end
  end
end

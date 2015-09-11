require 'test_helper'

class AdminsControllerTest < ActionController::TestCase

  #edit_users

  describe "the edit_users action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET the edit_users page" do
      get :edit_users
    end
  end

  #promote_demote

  describe "the promote_demote action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should POST change admin status" do
      @request.env["HTTP_REFERER"] = '/'
      post :promote_demote, { id: users(:steve).id }
    end
  end

  #sticky

  describe "the sticky action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should POST change sticky status" do
      @request.env["HTTP_REFERER"] = '/'
      post :sticky, { id: jots(:testJot).id }
    end
  end

end

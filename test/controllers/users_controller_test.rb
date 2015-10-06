require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  #index (homepage)

  describe "index action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET homepage" do
      get :index
      response.success?.must_equal true
    end
  end

  #new

  describe "new action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET new user page" do
      get :new
      response.success?.must_equal true
    end
  end
end

require 'test_helper'

class AdminsControllerTest < ActionController::TestCase

  #edit_users

  describe "edit_users action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET the edit_users page" do
      get :edit_users
      response.success?.must_equal true
    end
  end
end

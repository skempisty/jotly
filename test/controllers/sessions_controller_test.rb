require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  #new

  describe "the new action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "gets new session page" do
      get :new
      response.success?.must_equal true
    end
  end
end  

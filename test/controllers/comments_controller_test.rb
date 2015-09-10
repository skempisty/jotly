require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  #new

  describe "the new action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET new comment" do
      get :new, { :jot_id => 1 }
    end
  end

  #create

  describe "the create action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should create" do
      post :create, { jot_id: 1, comment: comments(:testComment).attributes }
    end
  end

  #index

  describe "the index action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should GET index" do
      get :index, { jot_id: 1 }
    end
  end

  #edit

  describe "the edit action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should GET the Edit page" do
      get :edit, { jot_id: 1, id: comments(:testComment).id }
    end
  end

  #update

  describe "the update action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should Update the comment" do
      patch :update, { jot_id: 1, id: comments(:testComment).id,
        comment: comments(:testComment).attributes }
    end
  end

  #destroy

  describe "the destroy action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should DELETE the comment" do
      @request.env["HTTP_REFERER"] = '/'
      delete :destroy, { jot_id: 1, id: comments(:testComment).id }
    end
  end
end

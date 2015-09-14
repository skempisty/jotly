require 'test_helper'

class RepliesControllerTest < ActionController::TestCase

  #new

  describe "the new action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET new reply" do
      get :new, { comment_id: comments(:testComment).id }
    end
  end

  #create

  describe "the create action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should POST a reply" do
      post :create, {
        comment_id: comments(:testComment).id,
        reply: replies(:testReply).attributes }
    end
  end

  #edit

  describe "the edit action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET edit reply" do
      get :edit, {
        comment_id: comments(:testComment).id,
        id: replies(:testReply).id }
    end
  end

  #update

  describe "the update action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should PATCH an update to reply" do
      patch :update, {
        comment_id: comments(:testComment).id,
        id: replies(:testReply).id,
        reply: replies(:testReply).attributes }
    end
  end

  #destroy

  describe "the destroy action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should DELETE reply" do
      @request.env["HTTP_REFERER"] = '/'
      delete :destroy, {
        comment_id: comments(:testComment).id,
        id: replies(:testReply).id }
    end
  end
  
end

require 'test_helper'

class RepliesControllerTest < ActionController::TestCase

  #new

  describe "the new action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET new reply" do
      get :new, { comment_id: comments(:testComment).id }
      response.success?.must_equal true
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
        response.success?.must_equal true
    end
  end

  #update

  describe "the update action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should PATCH an update to reply" do
      reply = replies(:testReply)
      replyInit = reply.content
      patch :update, {
        comment_id: comments(:testComment).id,
        id: replies(:testReply).id,
        reply: replies(:testReply).attributes = {content: "this is changed"}
        }
      replyFinal = reply.content
      replyFinal.wont_equal replyInit
    end
  end
end

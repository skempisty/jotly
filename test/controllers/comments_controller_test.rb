require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  #new

  describe "new action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET new comment" do
      get :new, { :jot_id => 1 }
      response.success?.must_equal true
    end
  end

  #create

  describe "create action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should increase count by 1" do
      assert_difference 'jots(:testJot).reload.comments_count', 1 do
        post :create, { jot_id: 1, comment: comments(:testComment).attributes }
      end
    end
  end

  #index

  describe "index action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should GET index page" do
      get :index, { jot_id: 1 }
      response.success?.must_equal true
    end
  end

  #edit

  describe "edit action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should GET the Edit page" do
      get :edit, { jot_id: 1, id: comments(:testComment).id }
      response.success?.must_equal true
    end
  end

  #update

  describe "update action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "changes comment attributes" do
      comment = comments(:testComment)
      commentInit = comment.content
      patch :update, { jot_id: 1, id: comments(:testComment).id,
        comment: comment.attributes = { content: "test1" }}
      commentFinal = comment.content
      commentFinal.wont_equal commentInit
    end
  end

  #destroy

  describe "DELETE destroy" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "deletes the comment" do
      @request.env["HTTP_REFERER"] = '/'
      assert_difference 'jots(:testJot).reload.comments_count', -1 do
        delete :destroy, { jot_id: 1, id: comments(:testComment).id }
      end
    end
  end
end

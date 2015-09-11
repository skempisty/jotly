require 'test_helper'

class JotsControllerTest < ActionController::TestCase

  #index

  describe "the index action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET jot index" do
      get :index
    end
  end

  #new

  describe "the new action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET new jot" do
      get :new
    end
  end

  #create

  describe "the create action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should POST a jot" do
      post :create, { jot: jots(:testJot).attributes }
    end
  end

  #edit

  describe "the edit action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET edit jot" do
      post :edit, { id: jots(:testJot).id }
    end
  end

  #update

  describe "the update action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should PATCH update a jot" do
      patch :update, { id: jots(:testJot).id, jot: jots(:testJot).attributes }
    end
  end

  #destroy

  describe "the destroy action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should DELETE the jot" do
      @request.env["HTTP_REFERER"] = '/'
      delete :destroy, { id: jots(:testJot).id }
    end
  end

  #followed

  describe "the followed action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should GET the followed page" do
      get :followed
    end
  end

  #my_jots

  describe "the my_jots action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should GET the my_jots page" do
      get :my_jots
    end
  end
end

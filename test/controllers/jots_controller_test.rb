require 'test_helper'

class JotsControllerTest < ActionController::TestCase

  #index

  describe "index action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET jot index" do
      get :index
      response.success?.must_equal true
    end
  end

  #new

  describe "new action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET new jot page" do
      get :new
      response.success?.must_equal true
    end
  end

  #create

  describe "create action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "redirects to jots_path" do
      post :create, { jot: jots(:testJot).attributes }
      assert_redirected_to (jots_path)
    end
  end

  #edit

  describe "edit action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should GET edit jot" do
      get :edit, { id: jots(:testJot).id }
      response.success?.must_equal true
    end
  end

  #update

  describe "update action" do
    before do
      session[:current_user] = users(:steve).id
    end

    it "should update the jot" do
      jot = jots(:testJot)
      jotInit = jot.content
      patch :update, { id: jots(:testJot).id,
        jot: jot.attributes = { content: "This is a test" }}
      jotFinal = jot.content
      jotFinal.wont_equal jotInit
    end
  end

  #followed

  describe "followed action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should GET the followed page" do
      get :followed
      response.success?.must_equal true
    end
  end

  #my_jots

  describe "my_jots action" do
    before do
      session[:current_user] = users(:steve).id
    end
    it "should GET the my_jots page" do
      get :my_jots
      response.success?.must_equal true
    end
  end
end

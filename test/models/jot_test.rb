require 'test_helper'

class JotTest < ActiveSupport::TestCase

#Test Jot creation

  describe "test jot create" do
    before do
      @testJot = Jot.create(
        title: 'test',
        content: 'This is only a test')

    end

    it "should create testJot" do
      @testJot.title.must_equal "test"
      @testJot.content.must_equal "This is only a test"
    end
  end


#Test liked_by?

  describe "test liked by?" do
    before do
      @likeTest = Like.create(
        user_id: '2',
        jot_id: '1')
      end

      it "should be liked by user 2" do
        jots(:testJot).liked_by?(2).must_equal true
      end
    end

end

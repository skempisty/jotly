require 'test_helper'

class JotTest < ActiveSupport::TestCase

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

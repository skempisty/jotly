require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  describe "test comment create" do
    before do
      @testComment = Comment.create(content: 'test comment')
    end

    it "should create testComment" do
      @testComment.content.must_equal "test comment"
    end
  end

end

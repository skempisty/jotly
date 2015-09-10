require 'test_helper'

class ReplyTest < ActiveSupport::TestCase

  describe "test reply create" do
    before do
      @testReply = Reply.create(content: 'test reply')
    end

    it "should create testReply" do
      @testReply.content.must_equal "test reply"
    end
  end

end

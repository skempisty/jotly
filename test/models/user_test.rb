require 'test_helper'

class UserTest < ActiveSupport::TestCase

  describe "test user create" do
    before do
      @you = User.create(name: 'BT')
    end

    it "should create BT" do
      # assert_equal "BT", @you.name
      @you.name.must_equal "BT"
    end
  end
  
end

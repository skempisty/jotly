class Follower < ActiveRecord::Base
  belongs_to: subscriber, class_name: "User"
  belongs_to: user, class_name: "User"
end

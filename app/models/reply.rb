class Reply < ActiveRecord::Base
  # Reply is a response to a comment
  belongs_to :user
  belongs_to :comment
end

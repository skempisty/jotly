class Comment < ActiveRecord::Base
belongs_to :jot
belongs_to :user
end

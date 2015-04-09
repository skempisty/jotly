class Comment < ActiveRecord::Base
belongs_to :jot, counter_cache: true
belongs_to :user
has_many :replies
end

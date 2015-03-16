class User < ActiveRecord::Base
  has_many :likes
  has_many :jots

  validates :name, uniqueness: true
end

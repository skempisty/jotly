class User < ActiveRecord::Base
  has_many :likes
  has_many :jots

  has_many :subscribers
  has_many :publishers

  validates :name, uniqueness: true
end

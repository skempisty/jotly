class User < ActiveRecord::Base
  has_many :likes
  has_many :jots
  has_many :comments
  has_many :replies

  has_many :followers
  has_many :subscribers, through: :followers

  validates :name, uniqueness: true
  

  has_secure_password







end

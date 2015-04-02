class Jot < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :comments

  validates :title, length: { maximum: 37,
    too_long: "%{count} characters is the maximum allowed" }
  validates :title, presence: true





  has_attached_file :photo,
    styles: { medium: "300x300>" },
    default_url: "http://placehold.it/300x300"
  validates_attachment_content_type :photo,
    :content_type => /\Aimage\/.*\Z/

  def liked_by?(user)
    likes.where(user: user).exists?
  end

geocoded_by :address
reverse_geocoded_by :lat, :long
end

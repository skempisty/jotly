class FollowerMailer < ApplicationMailer

  def new_follower
    mail(to: followed_by.email, subject: 'You have a new follower')
  end


end

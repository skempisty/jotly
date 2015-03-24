class JotMailer < ApplicationMailer
  def send_to_followers(jot)
    @jot = jot
    jot.user.followers.each do |follower|
      mail(to: "#{follower.user.name}@example.com", subject: "New Jot!")
    end
  end
end

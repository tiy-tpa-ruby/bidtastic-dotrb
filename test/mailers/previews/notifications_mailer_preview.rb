# Preview all emails at http://localhost:3000/rails/mailers/notifications_mailer
class NotificationsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/pre_auction_report
  def pre_auction_report
    NotificationsMailer.pre_auction_report
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/outbid
  def outbid
    NotificationsMailer.outbid
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/final_tally
  def final_tally
    NotificationsMailer.final_tally
  end

end

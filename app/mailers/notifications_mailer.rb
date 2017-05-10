class NotificationsMailer < ApplicationMailer
  default from: "webmaster@bidtastic.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.pre_auction_report.subject
  #
  def pre_auction_report
    @items = Item.all

    mail to: "to@example.org",
         subject: "Bidtastic: Pre Auction Report"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.outbid.subject
  #
  def outbid

    mail to: "to@example.org",
    subject: "Bidtastic: You have been Outbid!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.final_tally.subject
  #
  def final_tally
    @items = Item.all

    mail to: "to@example.org",
    subject: "Bidtastic: Final Tally Report"
  end
end

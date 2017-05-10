class NotificationsMailer < ApplicationMailer
  default from: "webmaster@bidtastic.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #   en.notifications_mailer.pre_auction_report.subject
  def pre_auction_report(items, current_admin)
    @items = Item.all
    @admin = current_admin

    mail(to: @admin.email, subject: "Bidtastic: Pre Auction Report")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #   en.notifications_mailer.outbid.subject
  def outbid(item, user)
    @user = user
    @item = item

    mail(to: @user.email, subject: "Bidtastic: You have been Outbid!")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #   en.notifications_mailer.final_tally.subject
  def final_tally(items, current_admin)
    @items = Item.all
    @admin = current_admin

    mail(to: @admin.email, subject: "Bidtastic: Final Tally Report")
  end
end

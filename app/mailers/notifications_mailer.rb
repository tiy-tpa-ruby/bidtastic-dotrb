class NotificationsMailer < ApplicationMailer
  default from: "webmaster@bidtastic.com"


  require 'sendgrid-ruby'
  include SendGrid

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  response = sg.client.mail._("send").post(request_body: data)
  puts response.status_code
  puts response.body
  puts response.headers



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
  def outbid(item)
    @item = item
    @user = @item.bids.second_to_last.created_by

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

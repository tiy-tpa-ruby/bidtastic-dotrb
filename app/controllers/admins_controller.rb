class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.new(admin_params)
    if admin.save
      session[:admin_id] = admin.id
      redirect_to items_path
    else
      redirect_to signup_path
    end
  end

  def send_pre_email
    items = Item.all
    admin = current_admin

    NotificationsMailer.pre_auction_report(items, admin).deliver_now
    redirect_to items_path
  end

  def send_post_email
    items = Item.all
    admin = current_admin

    NotificationsMailer.final_tally(items, admin).deliver_now
    redirect_to items_path
  end

    private
      def admin_params
        params.require(:admin).permit(:name, :email, :password, :password_confirmation)
      end

end

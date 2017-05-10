class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.new(admin_params)
    if admin.save
      admin_session[:admin_id] = admin.id
        # Redirect to the root, *OR* to whatever the main page of your app is
        # (if your root_path is your landing page...)
      redirect_to items_path
    else
      redirect_to signup_path
    end
  end

    private
      def admin_params
        params.require(:admin).permit(:name, :email, :password, :password_confirmation)
      end

end

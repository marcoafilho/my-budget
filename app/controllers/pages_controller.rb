class PagesController < ApplicationController
  def home
    redirect_to dashboard_path if current_user
    @user = User.new
  end
end

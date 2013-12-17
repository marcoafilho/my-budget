class DashboardsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @accounts = current_user.accounts    
  end
end

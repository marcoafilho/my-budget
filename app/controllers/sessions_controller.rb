class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      @user = User.new email: params[:email]
      flash.now.alert = I18n.t('sessions.create.unsuccessful')
      render 'pages/home'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: I18n.t('sessions.destroy.successful')
  end
end

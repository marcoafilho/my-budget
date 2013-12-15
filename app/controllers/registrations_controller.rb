class RegistrationsController < ApplicationController
  respond_to :html, :json

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, notice: I18n.t('registrations.create.successful')
    else
      render 'pages/home'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

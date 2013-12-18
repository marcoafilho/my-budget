class AccountsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :json

  def index
    @accounts = current_user.accounts

    respond_with @accounts
  end

  def show
    @account = current_user.accounts.find(params[:id])

    respond_with @account
  end

  def new
    @account = current_user.accounts.new

    respond_with @account
  end

  def create
    @account = current_user.accounts.new(account_params)

    if @account.save
      redirect_to accounts_path, notice: "Successfully created"
    else
      respond_with @account
    end
  end

  def edit
    @account = current_user.accounts.find(params[:id])

    respond_with @account
  end

  def update
    @account = current_user.accounts.find(params[:id])

    if @account.update(account_params)
      redirect_to accounts_path, notice: "Successfully updated"
    else
      respond_with @account
    end
  end

  def destroy
    account = current_user.accounts.find(params[:id])
    account.destroy

    redirect_to accounts_path
  end

  private
  def account_params
    params.require(:account).permit(:name, :kind, :currency_id)
  end
end

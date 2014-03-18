class TransactionsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, :json

  def index
    @transactions = current_user.transactions
  end

  def show
    @transaction = current_user.transactions.find(params[:id])
  end

  def new
    @transaction = current_user.transactions.new
  end

  def create
    @transaction = current_user.transactions.new(transaction_param)

    if @transaction.save
      redirect_to transactions_path, notice: I18n.t("transactions.create.successful")
    else
      respond_with @transaction
    end
  end

  def edit
    @transaction = current_user.transactions.find(params[:id])
  end

  def update
    @transaction = current_user.transactions.find(params[:id])

    if @transaction.update(transaction_param)
      redirect_to transactions_path, notice: I18n.t("transactions.update.successful")
    else
      respond_with @transaction
    end
  end

  def destroy
    transaction = current_user.transactions.find(params[:id])
    transaction.destroy

    redirect_to transactions_path, notice: I18n.t("transactions.destroy.successful")
  end

  private
  def transaction_param
    params.require(:transaction).permit(:account_id, :amount, :description, :due_at, :type)
  end
end

## AQUISICAO POR FORNECEDOR / Extrato / Transações formato money / Recálculo de saldo

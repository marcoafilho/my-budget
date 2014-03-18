class Account < ActiveRecord::Base
  KINDS = %w(Cash Checking Credit\ Card CD Investment Loan Savings Other)

  belongs_to :user
  belongs_to :currency

  has_many :transactions
  has_many :incomes
  has_many :expenses

  validates :user, presence: true
  validates :name, presence: true
  validates :kind, presence: true
  validates :currency_id, presence: true

  def net_worth
    incomes.sum(:amount) - expenses.sum(:amount)
  end
end

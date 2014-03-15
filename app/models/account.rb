class Account < ActiveRecord::Base
  KINDS = %w(Cash Checking Credit\ Card CD Investment Loan Savings Other)

  belongs_to :user
  belongs_to :currency

  validates :user, presence: true
  validates :name, presence: true
  validates :kind, presence: true
  validates :currency_id, presence: true
end

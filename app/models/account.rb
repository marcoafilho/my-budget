class Account < ActiveRecord::Base
  KINDS = [
    "Cash",
    "Credit Card",
    "Investment",
    "Loan",
    "Savings"
  ]

  belongs_to :user
  belongs_to :currency

  validates :user, presence: true
  validates :name, presence: true
  validates :kind, presence: true
  validates :currency_id, presence: true
end

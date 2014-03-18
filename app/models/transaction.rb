class Transaction < ActiveRecord::Base
  belongs_to :account

  default_scope -> { order("due_at DESC") }

  validates :account_id, presence: true
  validates :amount, presence: true, numericality: true
  validates :description, presence: true
  validates :type, presence: true

  TYPES = ["Expense", "Income"]
end

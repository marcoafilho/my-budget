class Account < ActiveRecord::Base
  belongs_to :user

  validate :name, presence: true
  validate :kind, presence: true
  validate :currency, presence: true
end

class Account < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :kind, presence: true
  validates :currency, presence: true
end

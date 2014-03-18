class User < ActiveRecord::Base
  has_secure_password validations: false

  has_many :accounts
  has_many :transactions, through: :accounts

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /.+@.+\..+/i }
  validates :password, presence: true, length: { minimum: 8 }
end

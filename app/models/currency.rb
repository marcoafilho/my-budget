class Currency < ActiveRecord::Base
  has_many :accounts

  validates :name, presence: true
  validates :code, presence: true
  validates :minor_unit, presence: true, numericality: { only_integer: true }

  def name_with_code
    "#{name}, #{code}"
  end
end

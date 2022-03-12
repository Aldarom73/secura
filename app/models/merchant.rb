class Merchant < ApplicationRecord
  has_many :orders
  has_many :disbursements
  has_many :shoppers, through: :orders
  validates :id, presence:true
  validates :name, presence:true, length: { in: 2..100 }
  validates :email, presence:true, length: { in: 6..40 }
  validates :cif, presence:true, length: { is: 10 }
end

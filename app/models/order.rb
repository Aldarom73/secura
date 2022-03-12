class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper
  validates_associated :merchant
  validates_presence_of :id
  validates :merchant_id, presence: true
  validates_presence_of :shopper_id
  validates_presence_of :amount
  validates_presence_of :created_at
end

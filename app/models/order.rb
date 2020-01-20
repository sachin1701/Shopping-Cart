#Table Schema ========
#id              :integer (PK)
#order_number    :string
#created_at      :datetime
#updated_at      :datetime


class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products

  before_create :add_order_number

  def add_order_number
    self.order_number = "ORN #{rand(1000000000)}" if Order.find_by(order_number: "ORN #{rand(1000000000)}").blank?
  end

end

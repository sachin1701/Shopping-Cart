#Table Schema =========
#id              :integer (PK)
#product_id      :integer
#order_id        :integer
#quantity        :integer
#effective_amount:float
#created_at      :datetime
#updated_at      :datetime

class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_create :set_effective_amount

  def set_effective_amount
    if self.product.name == "A" && self.quantity >= 3
      count = (self.quantity/3)
      discount = 15 * count
      cal_amount = ((self.product.price) * self.quantity) - (discount)
    elsif self.product.name == "B" && self.quantity >= 2
      count = (self.quantity/2)
      discount = 5 * count
      cal_amount = ((self.product.price) * self.quantity) - (discount)
    end

    if cal_amount.present? 
      self.amount = (self.product.price) * self.quantity
      self.effective_amount =  cal_amount
    else
      self.amount = (self.product.price) * self.quantity
      self.effective_amount = self.product.price * self.quantity
    end
  end
end

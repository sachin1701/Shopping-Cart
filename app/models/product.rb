#Table Schema =====
#id              :integer (PK)
#name            :string
#price           :float
#created_at      :datetime
#updated_at      :datetime


class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
end

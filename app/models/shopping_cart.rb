class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :products, through: :product_shopping_carts
end

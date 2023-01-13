class ShoppingCart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :product_shopping_carts, dependent: :destroy
  has_many :products, through: :product_shopping_carts
end

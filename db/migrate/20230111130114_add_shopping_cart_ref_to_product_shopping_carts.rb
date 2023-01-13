class AddShoppingCartRefToProductShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    add_reference :product_shopping_carts, :shopping_cart, null: false, foreign_key: true
  end
end

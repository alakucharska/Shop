class AddQuantityToProductShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :product_shopping_carts, :quantity, :integer
  end
end

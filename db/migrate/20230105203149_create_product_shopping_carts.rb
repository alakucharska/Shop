class CreateProductShoppingCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :product_shopping_carts do |t|

      t.timestamps
    end
  end
end

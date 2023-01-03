class CreateProductUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :product_users do |t|

      t.timestamps
    end
  end
end

Rails.application.routes.draw do
root 'products#index'
get 'shopping_carts/:id' => 'shopping_carts#show'
delete 'shopping_carts/:id' => 'shopping_carts#destroy'
resources :products
end

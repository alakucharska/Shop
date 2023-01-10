require "rails_helper"

RSpec.describe "Shopping Cart Controllers" , type: :request do
  let!(:shopping_cart) { create(:shopping_cart) }
  describe "#show" do
    it "shows content of the shopping cart " do
      get "/shopping_carts/#{shopping_cart.id}"
      expect(response).to render_template(:show)
    end
  end

  describe "#destroy" do
    it "destroys content of the shopping cart" do
      get "/shopping_carts/#{shopping_cart.id}"
      expect(response).to render_template(:show)
      delete "/shopping_carts/#{shopping_cart.id}"
      follow_redirect!
      expect(response).to render_template(:index)
    end
  end
end

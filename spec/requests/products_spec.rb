require 'rails_helper'

RSpec.describe "Products Controllers", type: :request do
  let!(:product) {Product.create(category: "paintings", name: "Elmo Raising", price: 456, description: "Beautiful painting")}
  describe "#index" do
    it "lists all products" do
      get "/products"
      expect(response).to render_template(:index)
    end
  end

  describe "#new" do
    it "shows the template to create a new product" do
      get "/products/new"
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    it "creates a new product" do
      get "/products/new"
      expect(response).to render_template(:new)
      post "/products", :params => { :product => { category: "paintings", name: "Elmo Raising", price: 456, description: "Beautiful painting" }}
      expect(response).to redirect_to(assigns(:product))
      follow_redirect!
      expect(response).to render_template(:show)
      expect(response.body).to include("New product has been created!")
    end
  end

  describe "#show" do
    it "shows information about the product" do
      get "/products/#{product.id}"
      expect(response).to render_template(:show)
    end
  end

  describe "#edit" do
    it "edits the information about the product" do
      get "/products/#{product.id}/edit"
      expect(response).to render_template(:edit)
    end
  end

  describe "#update" do
    it "updates the information about the product" do
      get "/products/#{product.id}/edit"
      expect(response).to render_template(:edit)
      put "/products/#{product.id}", params: { product: { name: "Rainy Day" } }
      expect(product.reload.name).to eq("Rainy Day")
      follow_redirect!
      expect(response).to render_template(:show)
      expect(response.body).to include("The Product has been updated!")
    end
  end

  describe "#destroy" do
    it "deletes the product from the database" do
      get "/products/#{product.id}"
      expect(response).to render_template(:show)
      delete "/products/#{product.id}"
      follow_redirect!
      expect(response).to render_template(:index)
      expect(response.body).to include("Product has been deleted")
    end
  end
end

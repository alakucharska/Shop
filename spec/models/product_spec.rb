require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "#category" do
    it "validates presence of the category" do
      product = Product.new(category: 1, name: "Elmo Raising", price: 456, description: "Beautiful painting")
      expect(product).to be_valid
    end

    it "does not save the product, if category has not been provided" do
      product = Product.new(category: nil, name: "Elmo Raising", price: 456, description: "Beautiful painting")
      expect(product).not_to be_valid
    end
  end

  describe "#name" do
    it "validates presence of the name" do
      product = Product.new(category: 1, name: "Elmo Raising", price: 456, description: "Beautiful painting")
      expect(product).to be_valid
    end

    it "does not save the product if name has nor been provided" do
      product = Product.new(category: 1, name: nil, price: 456, description: "Beautiful painting")
      expect(product).not_to be_valid
    end

    it "does not save the product if the name is too long" do
      product = Product.new(category: 1, name: "Elmo Raising"*50, price: 456, description: "Beautiful painting")
      expect(product).not_to be_valid
    end
  end

  describe "#price" do
    it "validates presence of the price" do
      product = Product.new(category: 1, name: "Elmo Raising", price: 456, description: "Beautiful painting")
      expect(product).to be_valid
    end

    it "does not save the product if price has not been provided" do
      product = Product.new(category: 1, name: "Elmo Raising", price: nil, description: "Beautiful Painting")
      expect(product).not_to be_valid
    end

    it "does not save the product if price is not numerical" do
      product = Product.new(category: 1, name: "Elmo Raising", price: "dwa", description: "Beautiful painting")
      expect(product).not_to be_valid
    end
  end

  describe "#description" do
    it "validates presence of the description" do
      product = Product.new(category: 1, name: "Elmo Raising", price: 456, description: "Beautiful painting")
      expect(product).to be_valid
  end

    it "does not save the product if the description has not been provided" do
      product = Product.new(category: 1, name: "Elmo Raising", price: 456, description: nil)
      expect(product).not_to be_valid
    end
  end 
end
